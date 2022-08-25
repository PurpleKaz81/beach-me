class AddDateToRents < ActiveRecord::Migration[7.0]
  def change
    add_column :rents, :rent_date, :date
    add_column :rents, :return_date, :date
  end
end
