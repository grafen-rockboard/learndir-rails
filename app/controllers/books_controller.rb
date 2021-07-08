# coding: utf-8
class BooksController < ApplicationController

  around_action :write_test, only: [:show]
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


    render plane: '<h1><%= "おはよう" %></h1>'
    
    
    # trial もしくは trial.htmlでアクセスすると root へリダイレクト
    # trial.json でアクセスすると @test をJSON形式で返す
    # respond_to do |format|
    #   format.html { redirect_to root_path }
    #   format.json { render json: @test }
    # end
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

    respond_to do |format|
      format.html { render :show }
      format.xml { render xml: @book }
      format.json { render json: @book }
    end
  end
  
  def edit
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to root_path
    else
      render :edit
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

  def write_test
    p '---------- around before -----------'
    p '------------------------------------'

    yield

    p '---------- around after ------------'
    p '------------------------------------'
  end
  
end
