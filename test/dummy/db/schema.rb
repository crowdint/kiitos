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

ActiveRecord::Schema.define(version: 20131104171901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kiitos_administrators", force: true do |t|
    t.integer "user_id"
  end

  add_index "kiitos_administrators", ["user_id"], name: "index_kiitos_administrators_on_user_id", using: :btree

  create_table "kiitos_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kiitos_kiitos", force: true do |t|
    t.string   "title"
    t.integer  "kiitos_category_id"
    t.string   "description"
    t.string   "state"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kiitos_kiitos", ["kiitos_category_id"], name: "index_kiitos_kiitos_on_kiitos_category_id", using: :btree

  create_table "kiitos_messages", force: true do |t|
    t.integer  "to"
    t.integer  "from"
    t.integer  "kiitos_kiito_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "anonymous",       default: false
  end

  add_index "kiitos_messages", ["kiitos_kiito_id"], name: "index_kiitos_messages_on_kiitos_kiito_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.string   "last_name"
  end

end
