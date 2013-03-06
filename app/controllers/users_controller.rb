#encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    #authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => 'Das kann nur ein Admin.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "Profildaten aktualisiert."
    else
      redirect_to users_path, :alert => "Profildaten konnten nicht geändert werden."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Das kann nur ein Admin.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "Mitglied gelöscht."
    else
      redirect_to users_path, :notice => "Selbstlöschung nicht möglich."
    end
  end
end