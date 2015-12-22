class AlbumsController < ApplicationController
  before_action :initilize_user
  before_action :initilize_album, except: [:index, :new, :create]
  respond_to :html, :js
  include AlbumsConcern
    
  def index 
    @albums = @user.albums.sort
    @albums = params[:search].present? ? @albums.search(params[:search]) : @albums
  end

  def new
    @album = @user.albums.new
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  def show
    @images = @album.images
  end

  def create
    @album = @user.albums.new(album_params)
    if @album.save
      flash.now[:notice] = "Successfully Album created"
      @albums = @user.albums
    end
    respond_to do |format|
      format.js {}
      format.html { redirect_to user_albums_path(current_user.id) }
    end
  end

  def destroy 
    if @album.destroy
      flash.now[:notice] = "Album Successfuly Deleted" 
      @albums = @user.albums
    end
    response_with_format
  end

  def update
    if @album.update_attributes(album_params)
      flash.now[:success] = "Successfuly Updated"
      @albums = @user.albums.sort
    else
      render 'edit' 
    end
    response_with_format
  end

  def coverpage
    variable = @album.images.where(:id => params[:image_id])
    if variable.present?
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

  def upvote 
    like_action(@album)
  end  

  def downvote
    unlike_action(@album)
  end

  private
 
  def initilize_album    
    @album = @user.albums.where(:id => params[:id]).first if @user.present?
    if @album.blank? 
      redirect_to root_path
    end
  end

  def initilize_user
    @user = User.where(:id => params[:user_id]).first
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
