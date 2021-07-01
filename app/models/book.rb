# coding: utf-8
class Book < ApplicationRecord
  has_many :rentals
  has_many :users, through: :rentals
  
  validates :name, presence: {message: "図書名を入力してください。"}
  validates :description, presence: true
  validates :price, presence: true
end
