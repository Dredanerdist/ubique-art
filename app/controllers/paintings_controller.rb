class PaintingsController < ApplicationController
  respond_to :html
  require 'rqrcode'
  # GET /paintings
  def index
    @paintings = Painting.scoped
  end

  # GET /paintings/1
  def show
    authorize! :show, painting
    if (params[:spotted]=='true') # TODO
      @spotted = true
    end
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
    
    painting.artist_profile = current_user.artist_profile

    if @painting.save
      redirect_to action: :index, notice: 'Bild angelegt.'
    else
      render action: "new"
    end
  end

  # PUT /paintings/1
  def update
    authorize! :update, painting

    if painting.update_attributes(params[:painting])
      redirect_to paintings_path, notice: 'Bilddaten aktualisiert.'
    else
      Rails.logger.debug painting.errors.to_yaml
      render action: :edit
    end
  end

  # DELETE /paintings/1
  def destroy
    authorize! :destroy, painting
    @painting.destroy

    redirect_to paintings_url
  end
  
  def qr
    render :layout => false
  end
  
  def qr_png # TODO only once, store image @S3
    size = Integer(params[:size]) || 10
    @qr = gen_qr
    image = ChunkyPNG::Image.new(size * @qr.modules.size, size * @qr.modules.size,
                  ChunkyPNG::Color::WHITE)
    @qr.modules.each_index do |x|
      @qr.modules.each_index do |y|
        if (@qr.dark?(x,y))
          image.rect(x * size, y * size, (x * size) + size, (y * size) + size, 
            ChunkyPNG::Color::BLACK, ChunkyPNG::Color::BLACK)
        end
      end
    end
    send_data(image , :filename => "qrcode.png", :type=>"image/png")
  end
  
  def qr_download
    @no_footer = true
  end

  private
  
  def gen_qr
    RQRCode::QRCode.new(painting_url(painting)+'&spotted=true', size:7)
  end
  helper_method :gen_qr
  
  def painting
    return @painting ||= Painting.find(params.fetch(:id))
  end
  helper_method :painting

  def paintings
    return @paintings
  end
  helper_method :paintings
end
