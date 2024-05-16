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

ActiveRecord::Schema[7.1].define(version: 2024_01_28_204311) do
  create_table "document_records", force: :cascade do |t|
    t.text "information"
    t.text "pendency"
    t.text "received_from"
    t.boolean "state", default: true
    t.date "reference_date", default: -> { "CURRENT_DATE" }
    t.integer "user_id", null: false
    t.integer "institution_id", null: false
    t.integer "document_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_type_id"], name: "index_document_records_on_document_type_id"
    t.index ["institution_id"], name: "index_document_records_on_institution_id"
    t.index ["user_id"], name: "index_document_records_on_user_id"
  end

  create_table "document_types", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.text "name", null: false
    t.integer "sector_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_institutions_on_sector_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "document_records", "document_types"
  add_foreign_key "document_records", "institutions"
  add_foreign_key "document_records", "users"
  add_foreign_key "institutions", "sectors"
end
