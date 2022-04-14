ActiveAdmin.register Announcement do
  permit_params :message, :expires_at

  form do |f|
    f.inputs do
      f.input :message
      f.input :expires_at, as: :datepicker
    end
    f.actions
  end
end
