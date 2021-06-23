class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save!
      redirect_to @book
    else
      :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to root_path
  end

  def destroy
    @book.destroy
    redirect_to_path(delete_book_path)
  end

  private
  def book_params
    params.require(:book).permit(:name, :description)
  end
end
