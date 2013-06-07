class UserPrefsController < ApplicationController

  def edit
    @user_pref = current_user.user_pref
  end

  def update

  end

end
