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

ActiveRecord::Schema.define(version: 2021_05_17_125415) do

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "member_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.boolean "is_deleted", default: false
    t.text "address"
    t.string "email"
    t.string "porstal_code"
    t.string "phone_number"
    t.string "encrypted_password"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.integer "mamber_id"
    t.string "porstal_code"
    t.string "address"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "price"
    t.integer "quantity"
    t.integer "making_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.string "porstal_code"
    t.string "address"
    t.string "name"
    t.integer "freight"
    t.integer "charge"
    t.integer "payment_method", default: 0
    t.integer "order_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "genre_id"
    t.string "name"
    t.text "describe"
    t.integer "price"
    t.string "image_id"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

end
