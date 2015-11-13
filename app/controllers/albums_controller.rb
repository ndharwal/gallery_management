class AlbumsController < ApplicationController
  
  def index
    @albums = current_user.albums
  end

  def new
    @album = current_user.albums.new
  end

  def show
    @album = current_user.albums.where(params[:id]).first
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      flash[:notice] = "Successfully Album created"
      redirect_to user_albums_path(current_user.id)
      else
      render :action => 'new'
    end
  end

  def destroy
    @album = current_user.albums.where(params[:id]).take
    if @album.destroy
      flash[:notice] = "Album Successfuly Deleted" 
      redirect_to user_albums_path(current_user.id)
      else 
      redirect_to back
    end
  end

  def edit
    @album = current_user.albums.where(params[:id]).take
  end 

  def update
    @album = current_user.albums.where(params[:id]).take
    if @album.update_attributes(album_params)
      flash[:success] = "Successfuly Updated"
    
      redirect_to user_albums_path(current_user.id)

      else
      render 'edit' 
    end
  end

  private

    def album_params
      params.require(:album).permit(:title, :description, :user_id)
    end

end
