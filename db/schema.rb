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

ActiveRecord::Schema.define(version: 20180601235413) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "style"
    t.string   "cuisine"
    t.time     "happy_hour_start_time"
    t.time     "happy_hour_end_time"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "address_latitude"
    t.float    "address_longitude"
    t.string   "address_formatted_address"
  end

  create_table "drink_orders", force: :cascade do |t|
    t.integer  "drink_id"
    t.integer  "bar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drinks", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_items", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_orders", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "bar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
