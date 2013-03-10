class SpotsController < ApplicationController
  def index
  end

  def show
    authorize! :show, spot
  end

  def new
    @spot = Spot.new
    authorize! :new, spot
  end

  def edit
    authorize! :edit, spot
  end

  def create
    @spot = Spot.new(params[:spot])
    authorize! :create, spot
  
    if spot.save
      redirect_to action: :index, notice: 'Spot erstellt.'
    else
      render action: "new" 
    end
  end

  def update
    authorize! :update, spot
    if spot.update_attributes(params[:spot])
      redirect_to spot, notice: 'Spotdaten aktualisiert.'
    else
      render action: "edit" 
    end
  end

  def destroy
    authorize! :destroy, spot
    
    spot.destroy

    redirect_to spots_url
  end

  private
  
  def spot
    return @spot ||= Spot.find(params[:id])
  end
  helper_method :spot
  def spots
    return @spots ||= Spot.all
  end
  helper_method :spots
end