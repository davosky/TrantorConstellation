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

ActiveRecord::Schema[7.1].define(version: 16) do
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

  create_table "mission_paths", force: :cascade do |t|
    t.string "path"
    t.decimal "road_lenght", precision: 8, scale: 2, default: "0.0"
    t.decimal "highway_cost", precision: 8, scale: 2, default: "0.0"
    t.integer "position"
    t.integer "operator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mission_places", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "operator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mission_reasons", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "operator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mission_structures", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "operator_id", null: false
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
    t.string "validator"
    t.string "validator_presentation"
    t.string "organizational"
    t.string "organizational_presentation"
    t.decimal "cost_per_km", precision: 8, scale: 2, default: "0.0"
    t.string "signature"
    t.string "validator_signature"
    t.string "organizational_signature"
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

  create_table "reimbursements", force: :cascade do |t|
    t.integer "reimbursement_number"
    t.date "departure_date"
    t.date "return_date"
    t.date "request_date"
    t.date "reimbursement_date"
    t.decimal "parking_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "food_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "room_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "ticket_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "generic_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "total_amount", precision: 8, scale: 2, default: "0.0"
    t.integer "operator_id"
    t.integer "mission_reason_id"
    t.integer "mission_path_id"
    t.integer "mission_place_id"
    t.integer "mission_structure_id"
    t.integer "transport_id"
    t.integer "veichle_id"
    t.string "operator_fr"
    t.string "reason_fr"
    t.string "path_fr"
    t.string "place_fr"
    t.string "structure_fr"
    t.string "transport_fr"
    t.string "veichle_fr"
    t.decimal "highway_cost_fr", precision: 8, scale: 2, default: "0.0"
    t.decimal "path_lenght_fr", precision: 8, scale: 2, default: "0.0"
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
