class AddEmailToContribution < ActiveRecord::Migration
  def self.up
    add_column :contributions, :email, :string
  end

  def self.down
    remove_column :contributions, :email
  end
end
