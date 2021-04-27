module ButtonMatchers
  def have_submit_button(name)
    have_selector(:test_id, name)
  end

  def have_no_submit_button(name)
    have_no_selector(:test_id, name)
  end
end
