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

ActiveRecord::Schema.define(version: 20160217014447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.date     "arrival_date"
    t.date     "departure_date"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "driver_first_name"
    t.string   "driver_last_name"
    t.text     "description"
    t.text     "tags",                           array: true
  end

  create_table "trucks", force: :cascade do |t|
    t.string   "name"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "fuel_type"
    t.float    "efficiency"
    t.string   "efficiency_unit"
    t.string   "trailer_type"
    t.integer  "capacity"
    t.integer  "monthly_maintence_costs"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
