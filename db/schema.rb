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

ActiveRecord::Schema.define(version: 2019_04_25_085346) do

  create_table "customers", force: :cascade do |t|
    t.string "phone", null: false
    t.string "name"
    t.string "address"
    t.string "sex"
    t.integer "origin"
    t.integer "level", default: 0
    t.string "wechart"
    t.string "qq"
    t.string "email"
    t.integer "state", default: 0
    t.integer "age"
    t.boolean "marriage"
    t.integer "birthday"
    t.string "work"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "context"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "number", default: 1, null: false
    t.string "type"
    t.integer "time"
    t.string "remake"
    t.integer "price", null: false
    t.integer "origin_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "time", null: false
    t.string "remake"
    t.integer "total_price", null: false
    t.integer "score", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "points", force: :cascade do |t|
    t.string "item_name"
    t.integer "value"
    t.integer "user_id"
    t.integer "order_id"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_points_on_order_id"
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "total", null: false
    t.string "number", null: false
    t.string "introduction"
    t.string "type"
    t.integer "time", null: false
    t.string "remake"
    t.integer "price", null: false
    t.string "color"
    t.string "size", null: false
    t.string "band"
    t.integer "classify"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "date", null: false
    t.string "detail"
    t.string "link"
    t.integer "degree", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "qq"
    t.string "wechat"
    t.string "real_name"
    t.string "password_digest"
    t.string "title"
    t.string "phone", null: false
    t.integer "level", default: 0
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
