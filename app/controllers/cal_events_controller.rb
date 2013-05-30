class CalEventsController < ApplicationController
  # Note that FullCalendar uses Title in place
  # of where I am using Summary
  before_filter :authenticate_request

  # this AJAX endpoint should return all events that
  # correspond to the calendar's filter settings
  def index
    events = CalEvent.all.map { |event| objectify_event(event) }
    render :json => events
  end


  # this AJAX endpoint should create a new calendar
  # event and return it
  def create
    event = CalEvent.new({
        :summary => params[:summary],
        :start => params[:start],
        :end => params[:end],
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
    puts "\n\n\n LET ME UPDATE YOUR EVENT!!! \n\n\n"
    if event.update_attributes({
        :summary => params[:summary],
        :start => params[:start],
        :end => params[:end],
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
      url = event.creator == current_user ? "#{cal_event_url(event)}" : ""
      editable = event.creator == current_user
      puts "\n\n"

      objectified_event = {
        id: event.id,
        title: event.summary,
        allDay: false,
        start: event.start,
        end: event.end,
        url: url,
        editable: editable,
        description: event.description || ""
      }
      puts objectified_event
      objectified_event
    end

end
