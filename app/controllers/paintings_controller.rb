class PaintingsController < ApplicationController
  respond_to :html
  # GET /paintings
  def index
    @paintings = Painting.scoped
  end

  # GET /paintings/1
  def show
    authorize! :show, painting
  end

  # GET /paintings/new
  def new
    @painting = Painting.new
    authorize! :new, painting
  end

  # GET /paintings/1/edit
  def edit
    authorize! :edit, painting
  end

  # POST /paintings
  def create
    @painting = Painting.new(params[:painting])
    authorize! :create, painting


    if @painting.save
      redirect_to action: :index, notice: 'Bild angelegt.'
    else
      render action: "new"
    end
  end

  # PUT /paintings/1
  def update
    authorize! :update, painting

    respond_to do |format|
      if @painting.update_attributes(params[:painting])
        redirect_to @painting, notice: 'Bilddaten aktualisiert.'
      else
        render action: "edit"
      end
    end
  end

  # DELETE /paintings/1
  def destroy
    authorize! :destroy, painting
    @painting.destroy

    redirect_to paintings_url
  end

  private
  def painting
    return @painting ||= Painting.find(params.fetch(:id))
  end
  helper_method :painting

  def paintings
    return @paintings
  end
  helper_method :paintings
end
