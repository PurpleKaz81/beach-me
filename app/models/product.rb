class Product < ApplicationRecord
  belongs_to :user
  has_many :rents
  validates :name, :description, :price, presence: true
  # validates :available?, inclusion: [true, false]
end
