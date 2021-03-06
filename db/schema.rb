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

ActiveRecord::Schema.define(version: 20130318020734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: true do |t|
    t.integer  "user_id",     null: false
    t.string   "user_name"
    t.string   "action_type", null: false
    t.datetime "happened_at", null: false
    t.json     "metadata",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["action_type"], name: "index_entries_on_action_type"
  add_index "entries", ["happened_at"], name: "index_entries_on_happened_at"
  add_index "entries", ["user_id"], name: "index_entries_on_user_id"

end
