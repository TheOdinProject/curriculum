ActiveAdmin.register Flag do
  actions :all, except: %i[destroy new]

  menu priority: 2
  config.batch_actions = false

  permit_params :status,
                :taken_action

  scope :resolved
  scope :active
  scope :pending

  includes :flagger, :project_submission

  index do
    selectable_column
    id_column

    column :flagger
    column :project_submission do |flag|
      auto_link(flag.project_submission, flag.project_submission.repo_url).html_safe
    end
    column :reason
    column :status
    column :taken_action

    actions
  end

  show do |flag|
    attributes_table do
      row :id
      row :flagger
      row :project_submission do
        link_to flag.project_submission.repo_url.to_s, flag.project_submission.repo_url
      end
      row :reason
      row :status
      row :taken_action
      row :created_at
      row :updated_at
      row :project_submission_flag_count do
        flags = Flag.where(project_submission: flag.project_submission)
        active = flags.count { |r| r.status == 'active' }
        resolved = flags.count { |r| r.status == 'resolved' }
        "#{flags.count} (#{active} active, #{resolved} resolved)"
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs do
      f.input :status
      f.input :taken_action
    end

    actions
  end

  filter :flagger
  filter :project_submission
  filter :taken_action, as: :check_boxes, collection: Flag.taken_actions.map { |ta| [ta[0].titleize, ta[1]] }
end
