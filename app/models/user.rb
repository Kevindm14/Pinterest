class User < ApplicationRecord
  has_many :pins, dependent: :destroy
  has_secure_password
  validates :email, uniqueness: true
  validates_presence_of :email, :password_digest
end
