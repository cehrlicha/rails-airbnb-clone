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

ActiveRecord::Schema.define(version: 20170525085149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friend_availabilities", force: :cascade do |t|
    t.datetime "start_daytime"
    t.datetime "end_daytime"
    t.integer  "friend_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["friend_id"], name: "index_friend_availabilities_on_friend_id", using: :btree
  end

  create_table "friends", force: :cascade do |t|
    t.string   "first_name"
    t.integer  "age"
    t.string   "phone_number"
    t.string   "gender"
    t.string   "city"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "photo"
    t.string   "last_name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_friends_on_user_id", using: :btree
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "start_daytime"
    t.datetime "end_daytime"
    t.string   "location"
    t.integer  "friend_id"
    t.integer  "buyer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["friend_id"], name: "index_sales_on_friend_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "username"
    t.string   "image"
    t.string   "cover_picture"
    t.string   "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "friend_availabilities", "friends"
  add_foreign_key "friends", "users"
  add_foreign_key "sales", "friends"
end
