class HeartIconPresenter
  attr_reader :user, :project, :view

  def initialize(user, project, view)
    @user = user
    @project = project
    @view = view
  end

  def self.render(user:, project:, view:)
    new(user, project, view).render
  end

  def render
    return heart_icon unless user
    return heart_icon if user == project.user
    like_or_unlike_button_for(user, project)
  end

  private

  def heart_icon
    '<span class="heart"><i class="fas fa-heart"></i></span>'.html_safe
  end

  def like_or_unlike_button_for(user, project)
    if user.liked? project
      unlike_button_for(project)
    else
      like_button_for(project)
    end
  end

  def like_button_for(project)
    view.button_to view.lesson_project_votes_path(project.lesson_id, project.id),
      method: :post,
      remote: true,
      title: 'Like this project',
      class: 'button button--primary project__vote-button' do
      '<i class="far fa-heart"></i>'.html_safe
    end
  end

  def unlike_button_for(project)
    view.button_to view.lesson_project_vote_path(project.lesson_id, project.id),
      method: :delete,
      remote: true,
      title: 'Unlike this project',
      class: 'button button--primary project__vote-button' do
      '<i class="fas fa-heart"></i>'.html_safe
    end
  end
end
