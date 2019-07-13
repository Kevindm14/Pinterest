class User < ApplicationRecord
  has_many :pins, dependent: :destroy
  validates_presence_of :first_name, :last_name, :image
end
