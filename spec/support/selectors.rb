module Selectors
  # Add ability to search for link by its href
  
  # Example usage:
  #   within(:link_to, link_path, text: "Optionally include text of link") do
  #           
  #   end

  # Example usage 2:
  #   subject.should have_selector(:link_to, link_path)

  Capybara.add_selector(:link_to) do
    xpath {|href| ".//a[@href='#{href}']"}
  end
end