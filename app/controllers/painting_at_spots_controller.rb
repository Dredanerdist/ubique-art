class PaintingAtSpotsController < ApplicationController
  # GET /painting_at_spots
  # GET /painting_at_spots.json
  def index
    @painting_at_spots = PaintingAtSpot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @painting_at_spots }
    end
  end

  # GET /painting_at_spots/1
  # GET /painting_at_spots/1.json
  def show
    @painting_at_spot = PaintingAtSpot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @painting_at_spot }
    end
  end

  # GET /painting_at_spots/new
  # GET /painting_at_spots/new.json
  def new
    @painting_at_spot = PaintingAtSpot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @painting_at_spot }
    end
  end

  # GET /painting_at_spots/1/edit
  def edit
    @painting_at_spot = PaintingAtSpot.find(params[:id])
  end

  # POST /painting_at_spots
  # POST /painting_at_spots.json
  def create
    @painting_at_spot = PaintingAtSpot.new(params[:painting_at_spot])

    respond_to do |format|
      if @painting_at_spot.save
        format.html { redirect_to @painting_at_spot, notice: 'Painting at spot was successfully created.' }
        format.json { render json: @painting_at_spot, status: :created, location: @painting_at_spot }
      else
        format.html { render action: "new" }
        format.json { render json: @painting_at_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /painting_at_spots/1
  # PUT /painting_at_spots/1.json
  def update
    @painting_at_spot = PaintingAtSpot.find(params[:id])

    respond_to do |format|
      if @painting_at_spot.update_attributes(params[:painting_at_spot])
        format.html { redirect_to @painting_at_spot, notice: 'Painting at spot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @painting_at_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /painting_at_spots/1
  # DELETE /painting_at_spots/1.json
  def destroy
    @painting_at_spot = PaintingAtSpot.find(params[:id])
    @painting_at_spot.destroy

    respond_to do |format|
      format.html { redirect_to painting_at_spots_url }
      format.json { head :no_content }
    end
  end
end
