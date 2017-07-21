class Book < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :title, :author, :description, presence: true
  validates :genre, presence: true, allow_blank: true

  def ordered?
    orders.where(returned_at: nil).present?
  end
end