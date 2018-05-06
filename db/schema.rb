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

ActiveRecord::Schema.define(version: 20180506030823) do

  create_table "listings", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image"
    t.integer  "user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "emailaddress"
    t.string   "cellphonenumber"
    t.string   "cellphonecarrier"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "listing_id"
    t.integer  "buyer_id"
    t.integer  "seller_id"
  end

  create_table "platformdemos", force: :cascade do |t|
    t.string   "Demo"
    t.integer  "user_id"
    t.string   "player"
    t.string   "coin"
    t.string   "lava"
    t.string   "enmey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_platformdemos_on_user_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string   "Game"
    t.integer  "user_id"
    t.string   "player"
    t.string   "coin"
    t.string   "lava"
    t.string   "enemy_1"
    t.string   "enemy_2"
    t.string   "enemy_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_platforms_on_user_id"
  end

  create_table "spaceshooters", force: :cascade do |t|
    t.string   "Game"
    t.integer  "user_id"
    t.string   "playership"
    t.string   "enemyships"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_spaceshooters_on_user_id"
  end

  create_table "tictactoes", force: :cascade do |t|
    t.string   "Game"
    t.integer  "user_id"
    t.string   "xs"
    t.string   "os"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tictactoes_on_user_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "recipient"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
