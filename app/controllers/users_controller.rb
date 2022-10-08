class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end

  end

  def update
    @item = User.find(params[:id])
    if @item.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@item.id)
    else
      @user = User.find(params[:id])
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end