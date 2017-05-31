module ButtonHelper
  def sign_up_button
    link_to 'Sign Up', sign_up_path(ref: 'success_stories'), class: 'button button--primary'
  end

  def curriculum_button
  	link_to 'Curriculum', curriculum_path(ref: 'success_stories'), class: 'button button--primary'
  end

  def gitter_button
    link_to 'Open Gitter', chat_link, class: 'button button--secondary', target: '_blank'
  end

  def contribute_button
    link_to 'Learn how to contribute', contributing_path, class: 'button button--primary'
  end
end
