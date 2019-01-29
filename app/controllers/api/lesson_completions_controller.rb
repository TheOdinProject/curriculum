module Api
  class LessonCompletionsController < ApplicationController
    before_action :authenticate

    def index
      render json: serialized_lesson_completions
    end

    private

    def serialized_lesson_completions
      Course.all.map do |course|
        CourseSerializer.as_json(course, days)
      end
    end

    def days
      params[:days].to_i
    end

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV.fetch('API_USERNAME') &&
          password == ENV.fetch('API_PASSWORD')
      end
    end
  end
end
