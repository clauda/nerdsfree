class RemoveColumnAreaFromNerd < ActiveRecord::Migration
  def self.up
    remove_column :nerds, :area
  end

  def self.down
    add_column :nerds, :area, :string
  end
end
