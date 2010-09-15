class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.string :source
      t.datetime :expires_at
      t.string :image_url
      t.string :headline
      t.string :time_zone, :limit => 3
      t.string :url
      t.decimal :amount, :precision => 12, :scale => 2
      t.string :source_url
      t.decimal :value, :precision => 12, :scale => 2
      t.string :source_id
      t.boolean :relevant
      t.string :city_code, :limit => 3
      t.integer :city_id
      
      t.timestamps
    end
    
    add_index :deals, :source_id, :unique => true
    add_index :deals, :source
    add_index :deals, :relevant
    add_index :deals, :city_code
    add_index :deals, :city_id
  end

  def self.down
    drop_table :deals
  end
end