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

ActiveRecord::Schema.define(version: 2019_04_20_113320) do

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "context"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
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
