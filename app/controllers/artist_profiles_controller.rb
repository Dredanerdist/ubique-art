#encoding: utf-8
class ArtistProfilesController < ApplicationController
  def index
    
  end

  def show
    authorize! :show, artist_profile
  end

  def new
    @artist_profile = ArtistProfile.new
    authorize! :new, artist_profile
  end

  def edit
    authorize! :edit, artist_profile
  end

  def create
    @artist_profile = ArtistProfile.new(params[:artist_profile])
    authorize! :create, artist_profile
    
    if artist_profile.save
      redirect_to action: :index, notice: 'Künstlerprofil angelegt.'
    else
      render action: "new"
    end
  end

  def update
    authorize! :update, artist_profile

    if artist_profile.update_attributes(params[:artist_profile])
      redirect_to artist_profile, notice: 'Künstlerprofil aktualisiert.'
    else
      render action: "edit"
    end
  end

  def destroy
    authorize! :destroy, artist_profile
    
    artist_profile.destroy

    redirect_to artist_profiles_url
  end
  
  private
  def artist_profile
    return @artist_profile ||= ArtistProfile.find(params.fetch(:id))
  end
  helper_method :artist_profile

  def artist_profiles
    return @artist_profiles ||= ArtistProfile.all
  end
  helper_method :artist_profiles
end
