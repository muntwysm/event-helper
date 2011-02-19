class AddReqToContribution < ActiveRecord::Migration
  def self.up
    add_column :contributions, :req, :boolean
  end

  def self.down
    remove_column :contributions, :req
  end
end
