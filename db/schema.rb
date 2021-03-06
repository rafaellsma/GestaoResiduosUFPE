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

ActiveRecord::Schema.define(version: 20171122024110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "centers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "center_id"
    t.string   "chief"
    t.string   "email"
    t.string   "phone_ext"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_departments_on_center_id", using: :btree
  end

  create_table "laboratories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
    t.index ["department_id"], name: "index_laboratories_on_department_id", using: :btree
  end

  create_table "laboratories_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "laboratory_id"
    t.integer  "status",        default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["laboratory_id"], name: "index_laboratories_users_on_laboratory_id", using: :btree
    t.index ["user_id"], name: "index_laboratories_users_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sediments", force: :cascade do |t|
    t.string  "composition"
    t.decimal "weight"
    t.date    "data_registered"
    t.integer "user_id"
    t.integer "laboratory_id"
    t.decimal "volume"
    t.string  "res_type"
    t.string  "recipient_type"
    t.string  "stock_location"
    t.integer "sediments_collect_id"
    t.index ["laboratory_id"], name: "index_sediments_on_laboratory_id", using: :btree
    t.index ["sediments_collect_id"], name: "index_sediments_on_sediments_collect_id", using: :btree
    t.index ["user_id"], name: "index_sediments_on_user_id", using: :btree
  end

  create_table "sediments_collects", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
    t.index ["department_id"], name: "index_sediments_collects_on_department_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.integer  "phone_ext"
    t.boolean  "admin",                  default: false
    t.string   "enrollment"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "departments", "centers"
  add_foreign_key "laboratories", "departments"
  add_foreign_key "laboratories_users", "laboratories"
  add_foreign_key "laboratories_users", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "sediments", "laboratories"
  add_foreign_key "sediments", "sediments_collects"
  add_foreign_key "sediments", "users"
  add_foreign_key "sediments_collects", "departments"
end
