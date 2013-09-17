class CalEventsController < ApplicationController
  # Note that FullCalendar uses Title in place
  # of where I am using Summary
  before_filter :authenticate_request

  # this AJAX endpoint should return all events that
  # correspond to the calendar's filter settings
  def index
    events = []

    # grabs availabilities from the current user and anyone
    # whose project list overlaps with the current user's
    # unless current user has unspecified projects... then
    # just return that user's projects
    if current_user.content_buckets.empty?
      events = current_user.cal_events
    else
      ids = current_user.content_bucket_ids
      u = User.joins(:content_buckets).where(:content_buckets => {:id => ids}).uniq.includes(:cal_events)
      u.each do |user| 
        events += user.cal_events
      end
    end
    
    events = events.map { |event| objectify_event(event) }
    render :json => events
  end


  # this AJAX endpoint should create a new calendar
  # event and return it
  def create
    event = CalEvent.new({
        :summary => params[:summary],
        :start => to_utc(params[:start]),
        :end => to_utc(params[:end]),
        :creator_id => current_user.id,
        :description => params[:description] 
      })

    if event.save
      render :json => objectify_event(event), :status => 201 # created
    else
      render :nothing => true, :status => 400 # bad request
    end
  end

  # this AJAX endpoint should update the (authenticated)
  # calendar event and return it
  def update
    event = CalEvent.find(params[:id])
    # puts "\n\n\n LET ME UPDATE YOUR EVENT!!! \n\n\n"
    if event.update_attributes({
        :summary => params[:summary],
        :start => to_utc(params[:start]),
        :end => to_utc(params[:end]),
        :description => params[:description] 
      })
      render :json => objectify_event(event), :status => 200 # okay
    else
      render :nothing => true, :status => 400 # bad request
    end
  end

  # this AJAX endpoint should delete the (authenticated)
  # calendar event and return nothing
  def destroy
    event = CalEvent.find(params[:id])
    if current_user == event.creator
      event.destroy
      render :nothing => true, :status => 204 # no content
    else
      render :nothing => true, :status => 403 # forbidden 
    end
  end


  private
    def authenticate_request
      unless user_signed_in?
        render :nothing => true, :status => 401 # unauthorized
      end
    end

    def objectify_event(event)
      if event.creator == current_user
        url = "#{cal_event_url(event)}"
        editable = true
      else
        url = ""
        editable = false
        color = "#aaa"
      end

      objectified_event = {
        id: event.id,
        title: event.creator.username, # event.summary,
        allDay: false,
        start: event.start,
        end: event.end,
        color: color,
        url: url,
        editable: editable,
        description: event.description || "",
        projects: event.creator.content_buckets.map(&:name),
        creator_name: event.creator.username,
        creator_email: event.creator.email,
        creator_profile_url: user_path(event.creator),
        creator_contact_url: new_user_contact_path(event.creator),
      }
      # puts "\n\n Putting ObjectifiedEvent:"
      # puts objectified_event
      # puts "\n\n"
      objectified_event
    end

    def to_utc(string)
      string.to_datetime.getutc
    end

end
