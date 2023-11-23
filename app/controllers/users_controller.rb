class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!

  def show
    @user = User.find(params[:id])
  end

  private

  def authorize_user!
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, alert: 'You are not authorized to perform this action'
    end
  end
end
