class CreateTreasures < ActiveRecord::Migration
  def change
    create_table :treasures do |t|
      t.float :longtitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
