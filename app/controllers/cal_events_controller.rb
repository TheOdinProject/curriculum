class CalEventsController < ApplicationController

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
