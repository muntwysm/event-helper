class CreateRequirements < ActiveRecord::Migration
  def self.up
    create_table :requirements do |t|
      t.integer :event_id
      t.integer :item_id
      t.integer :qty

      t.timestamps
    end
  end

  def self.down
    drop_table :requirements
  end
end
