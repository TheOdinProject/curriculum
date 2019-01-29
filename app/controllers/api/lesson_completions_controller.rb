module Api
  class LessonCompletionsController < ApplicationController
    before_action :authenticate

    def index
      render json: serialized_lesson_completions
    end

    private

    def serialized_lesson_completions
      Course.order(:position).map do |course|
        CourseSerializer.as_json(course, between_dates)
      end
    end

    def between_dates
      (DateTime.parse(start_date)..DateTime.parse(end_date))
    end

    def start_date
      params.fetch(:start_date, '2013/01/01')
    end

    def end_date
      params.fetch(:end_date, DateTime.now.to_s)
    end

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV.fetch('API_USERNAME') &&
          password == ENV.fetch('API_PASSWORD')
      end
    end
  end
end
