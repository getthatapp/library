class ReturnsController < ApplicationController
  def update
    book = Book.find(params[:book_id])
    order = book.orders.find_by(returned_at: nil)
    order.update(returned_at: DateTime.now)
    redirect_to book_path(book), success: "Thank you for returning this book."
  end

end