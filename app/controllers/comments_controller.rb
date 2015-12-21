class CommentsController < ApplicationController
 before_action :initialization
 before_action :authenticate_user!

  def new
    @comment = @commentable.comments.new
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  def create
    @comment = @commentable.comments.new(params_comment)
    if @comment.save
      flash.now[:success] = "you have commented"
    else
      flash.now[:success] = "Not commented"
    end  
    @comments = @commentable.comments.get_active_comment
    respond_to do |format|
      format.js { }
      format.html {}
    end   
  end

  def destroy
    @comments = @commentable.comments.get_comment(@commentable.id)
    comment = @comments.where(:id => params[:id]).first
    if comment.destroy
      flash.now[:success] = "comment deleted"
    else
      flash.now[:success] = "Not Deleted"
    end
    @comments = @commentable.comments.get_comment(@commentable.id)
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  private

  def initialization  
    if params[:album_id]
      @user = User.where(:id => current_user.id).first 
      @check_user_album  = @user.albums.where(:id => params[:album_id]).first
      @commentable = Album.where(:id => params[:album_id]).first
    else
      @commentable = Image.where(:id => params[:image_id]).first
    end
  end

  def params_comment
    params.require(:comment).permit(:comment, :active, :user_id)
  end
end
