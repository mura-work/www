class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @user.books = Book.where(params[:person_id])
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
  	params.require(:user).permit(:name, :image, :introduction)
  end
end

