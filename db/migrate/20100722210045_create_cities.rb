class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name
      t.string :code, :limit => 3
      t.string :state
      t.decimal :lat, :precision => 12, :scale => 7
      t.decimal :lng, :precision => 12, :scale => 7

      t.timestamps
    end
    
    add_index :cities, :code, :unique => true
    add_index :cities, :state
    add_index :cities, :lat
    add_index :cities, :lng
  end

  def self.down
    drop_table :cities
  end
end