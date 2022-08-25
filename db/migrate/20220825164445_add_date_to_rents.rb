class AddDateToRents < ActiveRecord::Migration[7.0]
  def change
    add_column :rents, :date, :date
  end
end
