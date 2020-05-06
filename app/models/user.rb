class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  validates :todo_text, length: { minimum: 1 }
  has_secure_password
  has_many :todos
end
