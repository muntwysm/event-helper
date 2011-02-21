class AddMapToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :map, :string
  end

  def self.down
    remove_column :locations, :map
  end
end
