class UserPrefsController < ApplicationController
  # before_filter :authenticate_request

  # def edit
  #   @user_pref = current_user.user_pref
  #   @content_buckets = ContentBucket.order(:name)

  #   # Hang onto the last page we visited so 
  #   # we can return to it upon successful form submission
  #   session["ref_edit_pref"] = request.referer || edit_user_pref_path
  # end

  # # replaces all old projects with the new batch
  # def update
  #   current_user.content_activations.delete_all
  #   params[:user_pref][:user][:content_bucket_ids].each do |id|
  #     next if id.blank?
  #     if ContentBucket.find(id)
  #       current_user.content_activations.create(:content_bucket_id => id.to_i)
  #     end
  #   end
  #   flash[:success] = "Preferences updated successfully"
  #   unless session["ref_edit_pref"].blank?
  #     redirect_to session["ref_edit_pref"]
  #     session["ref_edit_pref"] = nil
  #   else
  #     redirect_to :back
  #   end
  # end

  # protected

  #   def authenticate_request
  #     unless user_signed_in?
  #       render :nothing => true, :status => 401 # unauthorized
  #     end
  #   end

end
# ENV["HTTP_REFERER"]