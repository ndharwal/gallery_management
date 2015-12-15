class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @albums = current_user.albums
    @images = current_user.images
    comments = current_user.albums.joins(:comments).uniq.map{|com| com.comments}.flatten
    @comments = Comment.where(:id => comments).find_inactive_comments  
    if params[:value].present?
      @comment = @comments.where(:id => params[:comment_id]).first
      comment = @comment.update(:active => params[:value])
      redirect_to root_path
    end
  end  
end
