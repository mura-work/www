class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
      @users = User.where(id: ["2","3","4","5","6","7","8","1","10","11","12","13","23"] )
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を修正しました successfully"
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :image, :main_image, :format, :introduction, :career, :wants, :skill, :license, :hobby)
  end
end

