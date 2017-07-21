class OrdersController < ApplicationController
  def create
    if book.ordered?
      redirect_to book_path(book), danger: "You can't order this book. It's already ordered!"
    else
      book.orders.create(user: User.first)
      redirect_to book_path(book), success: "Book was successfuly ordered"
    end
  end

  private

  def book
    @book ||= Book.find(params[:book_id])
  end

end