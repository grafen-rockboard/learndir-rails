class Book < ApplicationRecord
  validates :name, presence: true, allow_nil: true
  validates :description, presence: true
  validates :price, presence: true
end
