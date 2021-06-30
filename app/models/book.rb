class Book < ApplicationRecord
  
  validates :name, presence: true, allow_nil: true
  validates :description, presence: true
  validates :price, presence: true
  validates :email, email_address: true

  # validate :email_check
  # private
  # def email_check
  #   email_pattern = /\A[\w+\-.]+@[a-z\d\-.-]+\.[a-z]+\z/
  #   unless email_pattern.match(self.email)
  #     errors.add(:email, "Enter email address correctly.")
  #   end
  # end
end
