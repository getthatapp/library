class BooksController < ApplicationController
  def index
    @books = Book.all.order(created_at: :DESC)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, success: "Book successfuly created"
    else
      render 'new'
    end
  end

  def show
    @orders = book.orders
  end

  def edit
    book
  end

  def update
    if book.update(book_params)
      redirect_to book_path(book), info: "Book updated"
    else
      render :edit
    end
  end

  def destroy
    book.destroy
    redirect_to root_path, danger: "Book deleted"
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :description, :image)
  end

  def book
    @book ||= Book.find(params[:id])
  end
end