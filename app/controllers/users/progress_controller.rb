module Users
  class ProgressController < ApplicationController
    before_action :authenticate_user!

    def destroy
      result = Users::ResetProgress.call(current_user)
      if result.success?
        redirect_to edit_user_registration_path, notice: 'Success: Your progress has been reset.'
      else
        redirect_to edit_user_registration_path, notice: 'Failure: Unable to reset your progress.'
      end
    end
  end
end
