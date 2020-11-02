# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_31_171011) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "congressmen", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.integer "external_id"
    t.string "uf"
    t.string "political_party"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spends", force: :cascade do |t|
    t.integer "congressman_id"
    t.string "description"
    t.string "provider"
    t.integer "liquid_value"
    t.date "document_emission_date"
    t.string "document_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["congressman_id"], name: "index_spends_on_congressman_id"
  end

  create_table "yearly_spends", force: :cascade do |t|
    t.integer "congressman_id"
    t.integer "year"
    t.integer "total_spend"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["congressman_id"], name: "index_yearly_spends_on_congressman_id"
  end

  add_foreign_key "spends", "congressmen"
  add_foreign_key "yearly_spends", "congressmen"
end
