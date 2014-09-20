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

ActiveRecord::Schema.define(version: 20140920183027) do

  create_table "events", force: true do |t|
    t.integer  "org_id"
    t.integer  "venue_id"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "start_time"
    t.string   "end_time"
    t.text     "description"
    t.string   "url"
    t.text     "spec_instruction"
    t.text     "ticket_rsvp_instruction"
    t.float    "price_low",               limit: 24
    t.float    "price_high",              limit: 24
    t.text     "restriction"
    t.string   "category"
    t.string   "subcategory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orgs", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "url"
    t.string   "phone"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
