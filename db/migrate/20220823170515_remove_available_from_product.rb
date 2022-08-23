class RemoveAvailableFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :available, :boolean
  end
end
