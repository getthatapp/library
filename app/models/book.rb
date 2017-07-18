class Book < ApplicationRecord
  validates :title, :author, :description, presence: true
  validates :genre, presence: true, allow_blank: true
end