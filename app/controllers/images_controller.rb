class ImagesController < ApplicationController

  def index    
   @images = Image.all
  end

  def new
    @image = Image.new
  end
    
  def create
    @image = Image.create(image_params)
     if @image.save
      flash[:notice] = "Successfully image uploaded"      
      redirect_to album_images_path(params[:album_id])
      else
      render :action => 'new'
    end
  end

  def update
  end

  def destroy    
    @image = Image.where(:id => params[:id]).first
      if @image.destroy
      flash[:notice] = "Image Successfuly Deleted" 
      redirect_to image_path(:id)
      else 
      redirect_to back
    end
  end

  def show
    @image = Image.where(:album_id => params[:album_id]).take    
  end

  def edit
  end

  private
  def image_params
      params.require(:image).permit(:img_name, :img_url, :img_size, :album_id, :id, :photo)
    end

end
