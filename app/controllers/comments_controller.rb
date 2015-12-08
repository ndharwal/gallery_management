class CommentsController < ApplicationController
 before_action :initialization


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
      flash.now[:success] = "you have commented"
    end
    @comments = @commentable.comments.where(:commentable_id => @commentable.id).all
    respond_to do |format|
      format.js { }
      format.html {}
    end   
  end

  def show
    @comments = @commentable.comments.where(:commentable_id => @commentable.id).all
  end

  def destroy
    @comments = @commentable.comments.where(:commentable_id => @commentable.id).all
    comment = @comments.where(:id => params[:id]).first
    if comment.destroy
      flash.now[:success] = "comment deleted"
    end
    @comments = @commentable.comments.where(:commentable_id => @commentable.id).all
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  private
  def initialization 
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
