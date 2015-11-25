class AlbumsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  autocomplete :album, :title
  respond_to :html, :js
  
  def index
    @albums = current_user.albums
    if params[:search]
        @albums = @albums.search(params[:search])
    else 
    end
      respond_to do |format|
        format.js {}
        format.html
      end
  end

  def new
    @album = current_user.albums.new
  end

  def show
    @album = current_user.albums.where(:id => params[:id]).first
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
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  def destroy
    @album = current_user.albums.where(:id => params[:id]).first
    if @album.destroy
      flash.now[:notice] = "Album Successfuly Deleted" 
      @albums = current_user.albums
    else 
      redirect_to back
    end
    respond_to do |format|
      format.js {}
      format.html
    end
  end

  def edit
    @album = current_user.albums.where(:id => params[:id]).first
  end 

  def update
    @album = current_user.albums.where(:id => params[:id]).first
      if @album.update_attributes(album_params)
        flash.now[:success] = "Successfuly Updated"
        @albums = current_user.albums.order(updated_at: :DESC)
      else
        render 'edit' 
    end
    respond_to do |format|
      format.js {}
      format.html
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :user_id, :id)
  end
end
