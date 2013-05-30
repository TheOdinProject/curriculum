class CalEventsController < ApplicationController
  # Note that FullCalendar uses Title in place
  # of where I am using Summary
  before_filter :authenticate_request

  # this AJAX endpoint should return all events that
  # correspond to the calendar's filter settings
  def index
    events = CalEvent.all.map do |event|
      objectify_event(event)
    end
    # puts "\n\n\n toJSON: #{events.to_json}! \n\n\n"
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
      render :json => event, :status => 400 # bad request
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
      {
        id: event.id,
        title: event.summary,
        allDay: false,
        start: event.start,
        end: event.end,
        url: "#{cal_event_url(event)}",
        editable: true,
        description: event.description || "",
      }
    end

end
