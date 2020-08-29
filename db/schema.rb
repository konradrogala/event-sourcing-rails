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

ActiveRecord::Schema.define(version: 2020_08_29_194913) do

  create_table "accounting_events", force: :cascade do |t|
    t.string "type", null: false
    t.integer "accounting_id", null: false
    t.text "data", null: false
    t.text "metadata", null: false
    t.datetime "created_at", null: false
    t.index ["accounting_id"], name: "index_accounting_events_on_accounting_id"
  end

  create_table "accountings", force: :cascade do |t|
    t.string "vat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "vat_active", default: false
  end

  create_table "income_invoice_events", force: :cascade do |t|
    t.string "type", null: false
    t.integer "income_invoice_id", null: false
    t.text "data", null: false
    t.text "metadata", null: false
    t.datetime "created_at", null: false
    t.index ["income_invoice_id"], name: "index_income_invoice_events_on_income_invoice_id"
  end

  create_table "income_invoices", force: :cascade do |t|
    t.integer "accounting_id", null: false
    t.string "number", null: false
    t.string "client_vatid"
    t.string "total_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tax_liabilities", force: :cascade do |t|
    t.integer "accounting_id", null: false
    t.string "vat_id", null: false
    t.string "month", null: false
    t.string "year", null: false
    t.string "tax_amount", null: false
    t.string "vat_amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
