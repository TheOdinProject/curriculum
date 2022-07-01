ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  page_action :reseed, method: :post do
    Lessons::ImportAllContentJob.perform_async
    redirect_to admin_dashboard_path, notice: 'Curriculum lesson import job running 🐢 Track the progress at /sidekiq'
  end

  action_item :reseed do
    link_to 'Seed Curriculum', admin_dashboard_reseed_path, method: :post
  end

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span I18n.t('active_admin.dashboard_welcome.welcome')
        small I18n.t('active_admin.dashboard_welcome.call_to_action')
      end
    end
  end
end
