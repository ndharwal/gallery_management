class AlbumsController < ApplicationController
  before_action :set_default, only: [:show, :update, :destroy, :edit, :coverpage]
  respond_to :html, :js
  
  def index
    @albums = current_user.albums.sort
    if params[:search]
      @albums = @albums.search(params[:search])
    end
    response_with_format
  end

  def new
    @album = current_user.albums.new
  end

  def show
    @images = @album.images
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      flash.now[:notice] = "Successfully Album created"
      @albums = current_user.albums
    else
      redirect_to :back
    end
    response_with_format
  end

  def destroy 
    if @album.destroy
      flash.now[:notice] = "Album Successfuly Deleted" 
      @albums = current_user.albums
    end
    response_with_format
  end

  def edit  
  end 

  def update
    if @album.update_attributes(album_params)
      flash.now[:success] = "Successfuly Updated"
      @albums = current_user.albums.sort
    else
      render 'edit' 
    end
    response_with_format
  end

  def coverpage
    if @album.images.where(:id => params[:image_id]).present? 
      if @album.update_attributes(:cover_id => params[:image_id])
        flash.now[:success] = "Successfuly Cover photo set"
        @albums = current_user.albums
      else
        redirect_to root_path
      end 
    else
      flash.now[:error] = "Cover photo not found"
      @albums = current_user.albums.sort
    end
    response_with_format
  end

  private
 
  def set_default
    @album = current_user.albums.where(:id => params[:id]).first
    if @album.blank?
      redirect_to root_path
    end
  end

  def response_with_format
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  def album_params
    params.require(:album).permit(:title, :description, :user_id, :id)
  end
end
