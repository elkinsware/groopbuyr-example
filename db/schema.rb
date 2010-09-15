# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100722210347) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "code",       :limit => 3
    t.string   "state"
    t.decimal  "lat",                     :precision => 12, :scale => 7
    t.decimal  "lng",                     :precision => 12, :scale => 7
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["code"], :name => "index_cities_on_code", :unique => true
  add_index "cities", ["lat"], :name => "index_cities_on_lat"
  add_index "cities", ["lng"], :name => "index_cities_on_lng"
  add_index "cities", ["state"], :name => "index_cities_on_state"

  create_table "deals", :force => true do |t|
    t.string   "source"
    t.datetime "expires_at"
    t.string   "image_url"
    t.string   "headline"
    t.string   "time_zone",  :limit => 3
    t.string   "url"
    t.decimal  "amount",                  :precision => 12, :scale => 2
    t.string   "source_url"
    t.decimal  "value",                   :precision => 12, :scale => 2
    t.string   "source_id"
    t.boolean  "relevant"
    t.string   "city_code",  :limit => 3
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deals", ["city_code"], :name => "index_deals_on_city_code"
  add_index "deals", ["city_id"], :name => "index_deals_on_city_id"
  add_index "deals", ["relevant"], :name => "index_deals_on_relevant"
  add_index "deals", ["source"], :name => "index_deals_on_source"
  add_index "deals", ["source_id"], :name => "index_deals_on_source_id", :unique => true

end
