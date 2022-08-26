class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :product, dependent: :destroy
  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :rent_date, :return_date, presence: true
  validates :return_date, comparison: { greater_than_or_equal_to: :rent_date }
  after_validation :decrease_product_quantity

  private
  
  def decrease_product_quantity
    return if self.quantity.blank?
    
    if self.quantity <= self.product.quantity
    self.product.quantity -= self.quantity
    self.product.save
    else
    self.errors.add(:quantity, "is greater than available quantity")
    end
  end
  
end
