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

ActiveRecord::Schema.define(version: 2019_05_12_144954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "supplier_product_id"
    t.bigint "order_form_id"
    t.string "detail"
    t.bigint "satisfaction"
    t.bigint "before_sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_form_id"], name: "index_comments_on_order_form_id"
    t.index ["supplier_product_id"], name: "index_comments_on_supplier_product_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "context"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "order_forms", force: :cascade do |t|
    t.bigint "supplier_id"
    t.bigint "product_id"
    t.bigint "user_id"
    t.bigint "reviewer_id"
    t.bigint "time", null: false
    t.bigint "number", null: false
    t.bigint "total_price"
    t.string "remark"
    t.bigint "priority", default: 0, null: false
    t.bigint "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_order_forms_on_product_id"
    t.index ["reviewer_id"], name: "index_order_forms_on_reviewer_id"
    t.index ["supplier_id"], name: "index_order_forms_on_supplier_id"
    t.index ["user_id"], name: "index_order_forms_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "number", null: false
    t.string "type"
    t.string "remark"
    t.string "color"
    t.string "classify"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "date", null: false
    t.string "detail"
    t.string "link"
    t.bigint "degree", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "supplier_products", force: :cascade do |t|
    t.bigint "supplier_id"
    t.bigint "product_id"
    t.string "commit"
    t.bigint "price"
    t.bigint "back_rate", default: 0
    t.bigint "standard", default: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_supplier_products_on_product_id"
    t.index ["supplier_id"], name: "index_supplier_products_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "phone", null: false
    t.string "name"
    t.bigint "type"
    t.string "address"
    t.bigint "level", default: 0
    t.string "email"
    t.bigint "state", default: 0
    t.string "concat"
    t.string "zip"
    t.string "bank_number"
    t.bigint "reputation", default: 100
    t.string "fax"
    t.string "remark"
    t.bigint "timely", default: 100
    t.bigint "aftersales", default: 100
    t.bigint "componiship", default: 100
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
    t.bigint "level", default: 0
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "comments", "order_forms"
  add_foreign_key "comments", "supplier_products"
  add_foreign_key "order_forms", "users"
  add_foreign_key "order_forms", "users", column: "reviewer_id"
  add_foreign_key "schedules", "users"
  add_foreign_key "supplier_products", "products"
  add_foreign_key "supplier_products", "suppliers"
end
