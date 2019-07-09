class Pin < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :image
end
