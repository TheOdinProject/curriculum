class CalEventsController < ApplicationController
  # Note that FullCalendar uses Title in place
  # of where I am using Summary
  before_filter :authenticate_request

  # this AJAX endpoint should return all events that
  # correspond to the calendar's filter settings
  def index
    events = CalEvent.all.map do |event|
      {
        id: event.id,
        title: event.summary,
        allDay: false,
        start: event.start,
        end: event.end,
        url: "http://www.google.com",
        editable: true,
      }
    end
    puts "\n\n\n toJSON: #{events.to_json}! \n\n\n"
    render :json => events
  end


  # this AJAX endpoint should create a new calendar
  # event and return it
  def create
    puts "\n\n\n #{params} \n\n\n"

    event = CalEvent.new({
      :summary => params[:summary],
      :start => params[:start],
      :end => params[:end],
      :creator_id => current_user.id 
    })
    if event.save
      render :json => event, :status => 201
    else
      render :json => event, :status => 400
    end
  end

  private
    def authenticate_request
      unless user_signed_in?
        render :nothing => true, :status => 401 
      end
    end

end
