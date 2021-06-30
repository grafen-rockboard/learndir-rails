# coding: utf-8
class BooksController < ApplicationController
  before_action :find_book, only: [:update, :destroy, :show, :edit]
  
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
  end
  
  def edit
  end
  
  def update
    if @book.update!(book_params)
      redirect_to @book
    else
      :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to_path(delete_book_path)
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:name, :description, :price, :email)
  end
end
