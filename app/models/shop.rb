# coding: utf-8
class Shop < ApplicationRecord
  validates :name, presence: { message: "ショップ名を入力してください。" }
end
