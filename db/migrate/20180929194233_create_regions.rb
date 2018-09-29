class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :zip_code, null: false
      t.string :name, null: false
      t.index :zip_code

      t.timestamps
    end
  end
end
