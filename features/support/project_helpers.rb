module ProjectHelpers
  def fill_project_form_with(repo_url, live_preview)
    fill_in 'Repository URL', with: repo_url
    fill_in 'Live Preview', with: live_preview
  end
end

World(ProjectHelpers)