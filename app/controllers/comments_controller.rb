class CommentsController < ApplicationController
 before_action :set_value

  def index
    @comments = @commentable.comments.all
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
      @comment = @commentable.comments.new(params_comment)
    if @comment.save
      flash[:success] = "you have commented"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
    @comment = @commentable.comments.where(:id => params[:id]).first
    if @comment.destroy
      flash[:success] = "comment deleted"
      redirect_to user_album_image_path(current_user.id, @commentable.album_id, @commentable.id)
    end
  end
  private
  def set_value
    if params[:album_id]
      @commentable = Album.where(:id => params[:album_id]).first
    else
      @commentable = Image.where(:id => params[:image_id]).first
    end
  end
  def params_comment
   params.require(:comment).permit(:comment)
  end

end
