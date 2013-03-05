class ArtistProfilesController < ApplicationController
  # GET /artist_profiles
  # GET /artist_profiles.json
  def index
    @artist_profiles = ArtistProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artist_profiles }
    end
  end

  # GET /artist_profiles/1
  # GET /artist_profiles/1.json
  def show
    @artist_profile = ArtistProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist_profile }
    end
  end

  # GET /artist_profiles/new
  # GET /artist_profiles/new.json
  def new
    @artist_profile = ArtistProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artist_profile }
    end
  end

  # GET /artist_profiles/1/edit
  def edit
    @artist_profile = ArtistProfile.find(params[:id])
  end

  # POST /artist_profiles
  # POST /artist_profiles.json
  def create
    @artist_profile = ArtistProfile.new(params[:artist_profile])

    respond_to do |format|
      if @artist_profile.save
        format.html { redirect_to @artist_profile, notice: 'Artist profile was successfully created.' }
        format.json { render json: @artist_profile, status: :created, location: @artist_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @artist_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /artist_profiles/1
  # PUT /artist_profiles/1.json
  def update
    @artist_profile = ArtistProfile.find(params[:id])

    respond_to do |format|
      if @artist_profile.update_attributes(params[:artist_profile])
        format.html { redirect_to @artist_profile, notice: 'Artist profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artist_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artist_profiles/1
  # DELETE /artist_profiles/1.json
  def destroy
    @artist_profile = ArtistProfile.find(params[:id])
    @artist_profile.destroy

    respond_to do |format|
      format.html { redirect_to artist_profiles_url }
      format.json { head :no_content }
    end
  end
end
