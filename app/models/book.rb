class Book < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :title, :author, :description, :image, presence: true
  validates :genre, presence: true, allow_blank: true

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def ordered?
    orders.where(returned_at: nil).present?
  end

end