class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.integer :event_id
      t.integer :item_id
      t.integer :qty

      t.timestamps
    end
  end

  def self.down
    drop_table :contributions
  end
end
