class HomeController < ApplicationController
  before_action :authenticate_user!, :initiliaze
  def index
    @albums = current_user.albums
    @images = current_user.images 
  end

  def comment_popup   
    if params[:value].present?
      @comment = @comments.where(:id => params[:comment_id]).first
      comment = @comment.update(:active => params[:value])
      flash.now[:success] ="You have accepted"
    end
    respond_to do |format|
      format.js {}
      format.html {}
    end  
  end

  def initiliaze
    comments = current_user.albums.joins(:comments).uniq.map{|com| com.comments}.flatten
    @comments = Comment.where(:id => comments).find_inactive_comments
  end
end



