class LessonCompletion < ActiveRecord::Base
  # This is the join table allowing students to mark a lesson completed

  
  validates_presence_of [:student_id, :lesson_id]
  validates_uniqueness_of :student_id, :scope => :lesson_id

  belongs_to :student, :class_name => "User"
  belongs_to :lesson


end
