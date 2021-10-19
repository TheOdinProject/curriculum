ActiveAdmin.register AdminFlash do

  permit_params :message, :expires

  form do |f|
    f.inputs do
      f.input :message
      f.input :expires, as: :datepicker
    end
    f.actions
  end
end
