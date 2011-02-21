class AddMapToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :map, :string
    change_column :locations, :map, :text
  end

  def self.down
    remove_column :locations, :map
  end
end
