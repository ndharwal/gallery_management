class HomeController < ApplicationController
  before_action :authenticate_user!, :initiliaze
  
  def index
    @albums = current_user.albums
    @images = current_user.images 
  end

  def comment_popup   
  
    @comment = @comments.where(:id => params[:comment_id]).first
    comment = @comment.update(:active => true)
    flash.now[:notice] ="You have accepted"
  
    respond_to do |format|
      format.js {}
      format.html {redirect_to :back}
    end  
  end

  private 
  
  def initiliaze
    @comments = Comment.get_all_inactive_comments(current_user.albums.map(&:id))  
  end
end



