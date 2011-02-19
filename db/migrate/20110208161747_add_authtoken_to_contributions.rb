class AddAuthtokenToContributions < ActiveRecord::Migration
  def self.up
    add_column :contributions, :authtoken, :string
  end

  def self.down
    remove_column :contributions, :authtoken
  end
end
