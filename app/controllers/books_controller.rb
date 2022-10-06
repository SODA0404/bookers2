class BooksController < ApplicationController
  def new
  end

  def create
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

  end

  def show
  end

  def destroy
  end
end
