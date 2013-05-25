class CalEventsController < ApplicationController

  # this endpoint should return all events that
  # correspond to the calendar's filter settings
  def index
    events = [
      {
        id: 123,
        title: "test 1",
        allDay: false,
        start: Time.now,
        end: Time.now + 3600,
        url: "http://www.google.com",
        editable: true,
      },
      {
        id: 124,
        title: "test 2",
        start: Time.now + 7200
      }
    ]
    render :json => events
  end


  # this endpoint should create a new calendar
  # event and return it
  def create
    puts "\n\n\n #{params} \n\n\n"
    event = {
      title: params[:title],
      start: params[:start],
      end: params[:end]
    }
    render :json => event
  end

end
