class Book < ApplicationRecord
  
  validate :email_check
  
  private
  def email_check
    email_pattern = /\A[\w+\-.]+@[a-z\d\-.-]+\.[a-z]+\z/
    unless email_pattern.match(self.email)
      errors.add(:email, "Enter email address correctly.")
    end
  end
end
