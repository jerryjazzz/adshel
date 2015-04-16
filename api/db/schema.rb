# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150416131446) do

  create_table "stops", force: :cascade do |t|
    t.string   "stop_id"
    t.string   "stop_name"
    t.string   "stop_desc"
    t.decimal  "stop_lat"
    t.decimal  "stop_lon"
    t.string   "zone_id"
    t.string   "stop_url"
    t.string   "stop_code"
    t.string   "stop_street"
    t.string   "stop_city"
    t.string   "stop_region"
    t.string   "stop_postcode"
    t.string   "stop_country"
    t.string   "location_type"
    t.string   "parent_station"
    t.string   "stop_timezone"
    t.string   "wheelchair_boarding"
    t.string   "direction"
    t.string   "position"
    t.string   "the_geom"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
