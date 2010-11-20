class CreateConfirmations < ActiveRecord::Migration
  def self.up
    create_table :confirmations do |t|
      t.references :nerd
      t.string :token

      t.timestamps
    end
    add_index :confirmations, :token, :unique => true
  end

  def self.down
    drop_table :confirmations
  end
end
