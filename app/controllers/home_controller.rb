class HomeController < ApplicationController
  def new
  end

  def show
  end

  def create
  end

  def index
  end

  def destroy
  end

  def update
  end

  def contactus
  end

  def aboutus
    respond_to do |format|
    format.js { render :layout=>false }
  end
  end
  
end
