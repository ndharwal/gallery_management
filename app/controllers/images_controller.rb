class ImagesController < ApplicationController
  before_filter :set_album

  def index    
   @images = @album.images.all
  end

  def new
    @image = @album.images.new   
  end
    
  def create
    @image = @album.images.new(image_params)
     if @image.save      
      flash[:notice] = "Successfully image uploaded"      
      redirect_to user_album_path(current_user.id, @album.id)
      else
      render :action => 'new'
    end
  end

  def update
  end

  def destroy
    @image = @album.images.where(:id => params[:id]).first
    if @image.destroy
       flash.now[:notice] = "Successfully image delete"
       @images = @album.images.all
    else 
      redirect_to back
    end
    respond_to do |format|
      format.js {}
      format.html
    end
  end

  def show
    @image = @album.images.where(:id => params[:id]).first
    @comments = @image.comments.reorder('created_at DESC')
    @comments = @comments.paginate(:page => params[:page], per_page: 5)
    
    respond_to do |format|
      format.js {}
      format.html
    end
  end

  def edit
  end 

  private

  def set_album
    @album = current_user.albums.where(:id => params[:album_id]).first
  end
  
  def image_params
    params.require(:image).permit(:img_name, :img_url, :img_size, :album_id, :id, :photo)
  end
  

    
end
