class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :product, dependent: :destroy
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :rent_date, :return_date, presence: true
  validates :return_date, comparison: { greater_than_or_equal_to: :rent_date }
end
