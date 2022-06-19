ActiveAdmin.register Announcement do
  permit_params :message, :expires_at, :user_id

  index do
    selectable_column
    id_column

    column :created_at
    column :updated_at
    column :message
    column :expires_at
    column 'Created By', :user_id, sortable: :user_id do |announcement|
      announcement.user&.username || '🤷'
    end
  end

  form do |f|
    f.inputs do
      f.input :message
      f.input :expires_at, as: :datepicker
      f.input :user_id, input_html: { value: f.current_user.id }, as: :hidden
    end
    f.actions
  end
end
