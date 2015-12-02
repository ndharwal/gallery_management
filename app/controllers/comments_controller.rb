class CommentsController < ApplicationController
 before_action :set_value

  def index
    @comments = @commentable.comments.all
  end

  def new
    @comment = @commentable.comments.new

    respond_to do |format|
      format.js {}
      format.html { redirect_to :back }
    end
  end

  def create
      @comment = @commentable.comments.new(params_comment)
    if @comment.save
      flash[:success] = "you have commented"
      check
    end
  end

  def edit
  end

  def update
  end

  def show
    @comments = @commentable.comments.where(:commentable_id => @commentable.id).all
  end

  def destroy
    @comment = @commentable.comments.where(:commentable_id => @commentable.id).first
    if @comment.destroy
      flash[:success] = "comment deleted"
      check
    end
  end

  def check
    if params[:album_id]
      redirect_to :back
    else
      redirect_to :back
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
