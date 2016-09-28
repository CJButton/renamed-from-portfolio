










class RenameHouseTable < ActiveRecord::Migration
  def change
    rename_table :houses_tables, :houses

  end
end
