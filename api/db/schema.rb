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

ActiveRecord::Schema.define(version: 20150419153055) do

  create_table "routes", force: :cascade do |t|
    t.string   "route_id"
    t.string   "agency_id"
    t.string   "route_short_name"
    t.string   "route_long_name"
    t.string   "route_desc"
    t.string   "route_type"
    t.string   "route_url"
    t.string   "route_color"
    t.string   "route_text_color"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "stop_times", force: :cascade do |t|
    t.string   "trip_id"
    t.string   "arrival_time"
    t.string   "departure_time"
    t.string   "stop_id"
    t.string   "stop_sequence"
    t.string   "stop_headsign"
    t.string   "pickup_type"
    t.string   "drop_off_type"
    t.string   "shape_dist_traveled"
    t.string   "timepoint"
    t.string   "arrival_time_seconds"
    t.string   "departure_time_seconds"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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

  create_table "trips", force: :cascade do |t|
    t.string   "route_id"
    t.string   "service_id"
    t.string   "trip_id"
    t.string   "trip_headsign"
    t.string   "direction_id"
    t.string   "block_id"
    t.string   "shape_id"
    t.string   "trip_short_name"
    t.string   "trip_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
