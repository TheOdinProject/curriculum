module PathsHelper
  def prerequisites_list_for(path)
    path.prerequisites.map do |prerequisite|
      link_to(
        prerequisite.title,
        path_url(prerequisite),
        class: 'card-main__prerequisite-link'
      )
    end.join(', ')
  end
end
