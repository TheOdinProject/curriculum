module ProjectsHelper
  def heart_icon_or_button_for(user, project)
    HeartIconPresenter.render(user: user, project: project, view: self)
  end
end
