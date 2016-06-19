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

ActiveRecord::Schema.define(version: 20160609164012) do

  create_table "keys", force: :cascade do |t|
    t.string   "name",        limit: 50,  null: false
    t.integer  "user_id",     limit: 4,   null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "auth_code",   limit: 255
    t.integer  "location_id", limit: 4
  end

  add_index "keys", ["location_id"], name: "index_keys_on_location_id", using: :btree
  add_index "keys", ["user_id"], name: "index_keys_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "address_line_1", limit: 255
    t.string   "address_line_2", limit: 255
    t.string   "parish",         limit: 255
    t.string   "post_code",      limit: 255
    t.integer  "capacity",       limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.string   "name",       limit: 20, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "ranks", ["name"], name: "name", unique: true, using: :btree

  create_table "retrievals", force: :cascade do |t|
    t.integer  "key_id",        limit: 4
    t.integer  "location_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "is_stored"
    t.boolean  "was_retrieved"
  end

  create_table "storages", force: :cascade do |t|
    t.integer  "key_id",        limit: 4
    t.integer  "location_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "is_stored"
    t.boolean  "was_retrieved"
  end

  add_index "storages", ["key_id"], name: "index_storages_on_key_id", using: :btree
  add_index "storages", ["location_id"], name: "index_storages_on_location_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "registered_ip_address",  limit: 15,               null: false
    t.string   "mobile_number",          limit: 25,               null: false
    t.integer  "rank_id",                limit: 4,   default: 0,  null: false
    t.boolean  "email_confirmed"
    t.string   "confirm_token",          limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["rank_id"], name: "index_users_on_rank_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "keys", "locations"
  add_foreign_key "keys", "users"
  add_foreign_key "storages", "keys"
  add_foreign_key "storages", "locations"
end
