# coding: utf-8
class Book < ApplicationRecord

  DESC_PATTERN  = ["東京", "大阪", "福岡"]
  
  validates :name, presence: true, postal_code: true
  validates :description, presence: true, inclusion: { in: DESC_PATTERN }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 99999 }
  validates :email, email_address: true
  
  # default_scope { where("name = ?", "test") }


  validate :select_check
  
  private
  def select_check
    unless DESC_PATTERN.include?(description)
      errors.add(:description, "東京、大阪、福岡のいずれかを入力してください。")
    end
  end
  
  

  # validate :email_check
  # private
  # def email_check
  #   email_pattern = /\A[\w+\-.]+@[a-z\d\-.-]+\.[a-z]+\z/
  #   unless email_pattern.match(self.email)
  #     errors.add(:email, "Enter email address correctly.")
  #   end
  # end
end
