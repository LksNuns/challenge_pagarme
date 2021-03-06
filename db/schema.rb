# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160718145709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "id_bank_account", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "bank_code",       null: false
    t.string   "agencia",         null: false
    t.string   "agencia_dv",      null: false
    t.string   "conta",           null: false
    t.string   "conta_dv",        null: false
    t.string   "document_number", null: false
    t.string   "legal_name",      null: false
    t.integer  "user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "desc"
    t.float    "min_donation", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id",      null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.string  "id_recipient",    null: false
    t.integer "user_id"
    t.integer "bank_account_id", null: false
  end

  add_index "recipients", ["id_recipient"], name: "index_recipients_on_id_recipient", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "id_transaction", null: false
    t.integer  "amount"
    t.integer  "product_id",     null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
