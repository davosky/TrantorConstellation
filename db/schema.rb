# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 9) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operators", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.boolean "supervisor"
    t.boolean "manager"
    t.boolean "regular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.bigint "province_id"
    t.bigint "category_id"
    t.bigint "institute_id"
    t.bigint "office_id"
    t.index ["category_id"], name: "index_operators_on_category_id"
    t.index ["institute_id"], name: "index_operators_on_institute_id"
    t.index ["office_id"], name: "index_operators_on_office_id"
    t.index ["province_id"], name: "index_operators_on_province_id"
    t.index ["region_id"], name: "index_operators_on_region_id"
    t.index ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true
    t.index ["username"], name: "index_operators_on_username", unique: true
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transports", force: :cascade do |t|
    t.integer "operator_id", null: false
    t.string "name"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "veichles", force: :cascade do |t|
    t.integer "operator_id", null: false
    t.string "producer"
    t.string "model"
    t.integer "position"
    t.string "license_plate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "operators", "categories"
  add_foreign_key "operators", "institutes"
  add_foreign_key "operators", "offices"
  add_foreign_key "operators", "provinces"
  add_foreign_key "operators", "regions"
end
