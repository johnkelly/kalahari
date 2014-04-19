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

ActiveRecord::Schema.define(version: 20140419061459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "appliances", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "foods", ["name"], name: "index_foods_on_name", unique: true, using: :btree

  create_table "measurements", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "measurements", ["name"], name: "index_measurements_on_name", unique: true, using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "email",                       null: false
    t.string   "password_digest",             null: false
    t.string   "auth_token",                  null: false
    t.string   "first_name",                  null: false
    t.integer  "sign_in_count",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_appliances", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid "user_id"
    t.uuid "appliance_id"
  end

  add_index "users_appliances", ["appliance_id"], name: "index_users_appliances_on_appliance_id", using: :btree
  add_index "users_appliances", ["user_id", "appliance_id"], name: "index_users_appliances_on_user_id_and_appliance_id", unique: true, using: :btree
  add_index "users_appliances", ["user_id"], name: "index_users_appliances_on_user_id", using: :btree

end
