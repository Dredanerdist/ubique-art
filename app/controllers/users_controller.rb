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
    authorize! :update, user
    if @user.update_attributes(params[:user])
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
  
  def like # using CURRENT_USER
    session[:return_to] ||= request.referer
    painting = Painting.find(params[:painting_id])
    if can? :like, painting and not current_user.liked_paintings.include? painting
      current_user.liked_paintings << painting
      current_user.save
    end
    redirect_to session.delete(:return_to) 
  end
  
  def unlike # using CURRENT_USER
    session[:return_to] ||= request.referer
    painting = Painting.find(params[:painting_id])
    current_user.liked_paintings.delete painting
    current_user.save
    redirect_to session.delete(:return_to) 
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