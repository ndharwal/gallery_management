class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @albums = current_user.albums
    @images = current_user.images
  end  
end
