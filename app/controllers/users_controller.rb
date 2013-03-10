#encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, User, :message => 'Nur für registrierte Mitglieder.'
  end

  def show
    authorize! :show, user
  end
  
  def update
    authorize! :update, user, :message => 'Das kann nur ein Admin.'
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "Profildaten aktualisiert."
    else
      redirect_to users_path, :alert => "Profildaten konnten nicht geändert werden."
    end
  end
    
  def destroy
    authorize! :destroy, user, :message => 'Das kann nur ein Admin.'
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "Mitglied gelöscht."
    else
      redirect_to users_path, :notice => "Selbstlöschung nicht möglich."
    end
  end
  private
  
  def user
    return @user ||= User.find(params[:id])
  end
  helper_method :user
  def users
    return @users ||= User.all
  end
  helper_method :users
end