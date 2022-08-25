class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :product, dependent: :destroy
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
