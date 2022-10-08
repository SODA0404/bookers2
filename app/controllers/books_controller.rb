class BooksController < ApplicationController

  def index
    @books = Book.all
    @new_book = Book.new
    @user = current_user
  end


  def create
    @item = Book.new(book_params)
    @item.user_id = current_user.id
    if @item.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@item.id)
    else
      @books = Book.all
      @new_book = Book.new
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @item = Book.find(params[:id])
    if @item.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@update_book.id)
    else
      @book = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
