class ReturnsController < ApplicationController
  def update
    book = Book.find(params[:book_id])
    order = book.orders.find_by(returned_at: nil)
    if order.user == current_user
      order.update(returned_at: DateTime.now)
      redirect_to book_path(book), success: "Thank you for returning this book"
    else
      redirect_to book_path(book), danger: "You can't return this book. It's borrowed by someone else!"
    end
  end

end