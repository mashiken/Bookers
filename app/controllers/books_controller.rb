class BooksController < ApplicationController
  def index
  	@books = Book.all.order(created_at: :asc)
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def top
  end

  def create
    @books = Book.all.order(created_at: :asc)
  	@book = Book.new(book_params)
  	if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was success fully created"
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
