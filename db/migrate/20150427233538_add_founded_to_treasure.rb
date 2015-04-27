class AddFoundedToTreasure < ActiveRecord::Migration
  def change
    add_column :treasures, :founded, :integer, default: 0
  end
end
