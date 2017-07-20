class OrdersController < ApplicationController
  def create
    book.orders.create(user: User.first)
    redirect_to book_path(book), notice: "Book was successfuly ordered"
  end

  private

  def book
    @book ||= Book.find(params[:book_id])
  end
end