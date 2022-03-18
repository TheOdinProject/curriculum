module Redirectors
  class NestedLessonRedirector
    def call(params, request)
      path = lesson_path(params[:course_id], params[:id])

      "http://#{request.host_with_port}/#{path}"
    end

    private

    def lesson_path(course_id, lesson_id)
      lesson = ::Course.find(course_id).lessons.find(lesson_id)
      "lessons/#{lesson.slug}"
    rescue ActiveRecord::RecordNotFound
      'paths'
    end
  end
end
