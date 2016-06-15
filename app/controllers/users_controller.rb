class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def profiles
    @users = User.all
  end
end
