class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name
      t.integer :toyable_id, null: false, unique: true
      t.string :toyable_type

      t.references :toyable, polymorphic: true, index: true
    end
  end
end
