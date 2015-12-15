class UsersController < ApplicationController

 def show 
    @users = User.current_user_skip(current_user)
    @user =  User.where(:id => params[:id]).first
  end
end
