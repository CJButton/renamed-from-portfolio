









class RenamePeopleTables < ActiveRecord::Migration
  def change
    rename_table :people_tables, :people
  end
end
