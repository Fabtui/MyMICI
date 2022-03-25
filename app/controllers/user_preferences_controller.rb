class UserPreferencesController < ApplicationController
  def new
    @preferences = Preference.all
    @user_preference = UserPreference.new
  end

  def create
    @user_preference = UserPreference.new(user_id: current_user.id, preference_id: params[:user_preference][:preference])
    @user_preference.save
    redirect_to new_user_preference_path
  end

  def destroy
    @user_preference = UserPreference.where(user_id: current_user.id).find_by_preference_id(params[:id])
    @user_preference.destroy
    redirect_to new_user_preference_path
  end
end
