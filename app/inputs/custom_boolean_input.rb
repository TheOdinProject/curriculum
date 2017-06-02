class CustomBooleanInput < SimpleForm::Inputs::BooleanInput
  def input_html_classes
    super.push("normal-checkbox")
  end

  private


    def build_check_box(unchecked_value, options)
      @builder.check_box(attribute_name, options, checked_value, unchecked_value) +
      @builder.label(attribute_name, class: "custom-checkbox") do
        " "
      end
    end
end
