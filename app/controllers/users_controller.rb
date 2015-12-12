class UsersController < ApplicationController

 def show
  @users = User.all
  @user = User.where(:id => params[:id]).first
 end 
end
