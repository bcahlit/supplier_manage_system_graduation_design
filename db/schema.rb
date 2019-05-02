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

ActiveRecord::Schema.define(version: 2019_05_02_071837) do

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "context"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "order_forms", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "product_id"
    t.integer "operator_id"
    t.integer "reviewer_id"
    t.integer "time", null: false
    t.integer "number", null: false
    t.string "remark"
    t.integer "priority", default: 0, null: false
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id"], name: "index_order_forms_on_operator_id"
    t.index ["product_id"], name: "index_order_forms_on_product_id"
    t.index ["reviewer_id"], name: "index_order_forms_on_reviewer_id"
    t.index ["supplier_id"], name: "index_order_forms_on_supplier_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "number", null: false
    t.string "type"
    t.string "remark"
    t.string "color"
    t.string "size", null: false
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

  create_table "suppler_products", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "product_id"
    t.string "commit"
    t.integer "price"
    t.integer "back_rate"
    t.integer "standard"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_suppler_products_on_product_id"
    t.index ["supplier_id"], name: "index_suppler_products_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "phone", null: false
    t.string "name"
    t.integer "type"
    t.string "address"
    t.integer "level", default: 0
    t.string "email"
    t.integer "state", default: 0
    t.string "concat"
    t.string "zip"
    t.string "bank_number"
    t.integer "reputation"
    t.string "fax"
    t.string "remark"
    t.integer "timely", default: 100
    t.integer "aftersales", default: 100
    t.integer "componiship", default: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
