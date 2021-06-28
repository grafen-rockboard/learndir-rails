# coding: utf-8
class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def trial

    @test = [
      { name: "tanaka", age: 22 },
      { name: "yamada", age: 18 }
    ]
    
    puts '----------- trial --------------'
    
    
    # trial もしくは trial.htmlでアクセスすると root へリダイレクト
    # trial.json でアクセスすると @test をJSON形式で返す
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: @test }
    end
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
