class AddColumnConfirmedToNerd < ActiveRecord::Migration
  def self.up
    add_column :nerds, :confirmed, :boolean, :default => false
  end

  def self.down
    remove_column :nerds, :confirmed
  end
end
