









class AddNullToHouseId < ActiveRecord::Migration
  def change
    change_column :people, :house_id, :integer, :null => false
    change_column :houses, :address, :string, :null => false
  end
end
