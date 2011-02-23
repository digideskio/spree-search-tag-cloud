class CreateSearchRecords < ActiveRecord::Migration
  def self.up
    create_table :search_records do |t|
      t.string :term
      t.integer :count, :null => false, :default => 0
      t.string :stype, :null => false, :default => 'phrase'
    end
  end

  def self.down
    drop_table :search_records
  end
end
