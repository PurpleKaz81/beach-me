class AddQuantityToRents < ActiveRecord::Migration[7.0]
  def change
    add_column :rents, :quantity, :integer
  end
end
