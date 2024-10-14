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

ActiveRecord::Schema[7.0].define(version: 8) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_reasons_on_user_id"
  end

  create_table "reimbursements", force: :cascade do |t|
    t.integer "name"
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
    t.bigint "place_id"
    t.bigint "reason_id"
    t.bigint "road_id"
    t.bigint "structure_id"
    t.bigint "transport_id"
    t.bigint "user_id"
    t.bigint "veichle_id"
    t.string "place_fr"
    t.string "reason_fr"
    t.string "road_fr"
    t.string "structure_fr"
    t.string "transport_fr"
    t.string "user_fr"
    t.string "veichle_fr"
    t.decimal "highway_cost_fr", precision: 8, scale: 2, default: "0.0"
    t.decimal "road_lenght_fr", precision: 8, scale: 2, default: "0.0"
    t.index ["place_id"], name: "index_reimbursements_on_place_id"
    t.index ["reason_id"], name: "index_reimbursements_on_reason_id"
    t.index ["road_id"], name: "index_reimbursements_on_road_id"
    t.index ["structure_id"], name: "index_reimbursements_on_structure_id"
    t.index ["transport_id"], name: "index_reimbursements_on_transport_id"
    t.index ["user_id"], name: "index_reimbursements_on_user_id"
    t.index ["veichle_id"], name: "index_reimbursements_on_veichle_id"
  end

  create_table "roads", force: :cascade do |t|
    t.string "name"
    t.decimal "road_lenght", precision: 8, scale: 2
    t.decimal "highway_cost", precision: 8, scale: 2
    t.integer "position"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_roads_on_user_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_structures_on_user_id"
  end

  create_table "transports", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_transports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.boolean "accounter"
    t.boolean "manager"
    t.boolean "regular"
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "sex"
    t.string "first_name"
    t.string "last_name"
    t.string "region"
    t.string "province"
    t.string "institute"
    t.string "office"
    t.string "category"
    t.string "validator"
    t.string "validator_presentation"
    t.string "organizational"
    t.string "organizational_presentation"
    t.string "confirmator"
    t.string "confirmator_presentation"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "veichles", force: :cascade do |t|
    t.string "name"
    t.string "producer"
    t.string "license_plate"
    t.string "fuel_type"
    t.decimal "cost_per_km", precision: 8, scale: 2, default: "0.0"
    t.string "territory"
    t.integer "position"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_veichles_on_user_id"
  end

end
