ActiveAdmin.register Flag do
  actions :all, except: %i[destroy new]

  menu priority: 2
  config.batch_actions = false

  permit_params :status, :taken_action

  scope :active, default: true
  scope :resolved

  member_action :ban_flagged_user, method: :post

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
      row :flagger
      row :reason
      row :submission_ower do
        flag.project_submission.user.username
      end
      row :repo_url do
        link_to flag.project_submission.repo_url, flag.project_submission.repo_url, target: '_blank'
      end
      row :live_preview_url do
        link_to flag.project_submission.live_preview_url, flag.project_submission.live_preview_url, target: '_blank'
      end
      row :status
      row :taken_action
      row :created_at
      row :project_submission_flag_count do
        flags = Flag.where(project_submission: flag.project_submission)
        active = flags.count { |r| r.status == 'active' }
        resolved = flags.count { |r| r.status == 'resolved' }
        "#{flags.count} (#{active} active, #{resolved} resolved)"
      end

      render 'flag_actions'
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs do
      f.input :status
      f.input :taken_action
    end

    actions
  end

  controller do
    def ban_flagged_user
      result = Admin::Flags::BanUser.call(flag: resource)

      if result.success?
        redirect_to resource_path(resource), notice: 'Success: User has been banned'
      else
        redirect_to resource_path(resource), notice: 'Failure: Unable to ban user, please check logs.'
      end
    end
  end

  filter :flagger
  filter :project_submission
  filter :taken_action, as: :check_boxes, collection: Flag.taken_actions.map { |ta| [ta[0].titleize, ta[1]] }
end
