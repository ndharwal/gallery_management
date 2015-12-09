class HomeController < ApplicationController
  before_action :authenticate_user!
  helper :home
  def index
    @albums = current_user.albums.all
  end  
end
