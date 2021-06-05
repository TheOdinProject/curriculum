class RenameWebDevelopment101Path < ActiveRecord::Migration[6.0]
  def up
    path = Path.find_by!(title: 'Web Development 101')
    path.update!(title: 'Foundations')

    course = Course.find_by!(title: 'Web Development 101')
    course.update!(title: 'Foundations')
  end

  def down
    path = Path.find_by!(title: 'Foundations')
    path.update!(title: 'Web Development 101')

    course = Course.find_by!(title: 'Foundations')
    course.update!(title: 'Web Development 101')
  end
end
