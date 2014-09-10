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

ActiveRecord::Schema.define(version: 20140910151119) do

  create_table "bills", force: true do |t|
    t.string   "summary"
    t.string   "from"
    t.date     "date"
    t.string   "bill_number"
    t.string   "to"
    t.string   "due_on"
    t.string   "purchase_order_number"
    t.text     "bill_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.string   "state"
    t.decimal  "amount"
  end

  add_index "bills", ["user_id"], name: "index_bills_on_user_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "unit_price"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "currency_id"
    t.string   "email"
    t.string   "phone"
    t.string   "website_url"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.string   "client"
    t.text     "description"
    t.string   "hours"
    t.string   "file"
    t.string   "link"
    t.string   "tag_list"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "entries", ["user_id"], name: "index_entries_on_user_id"

  create_table "estimates", force: true do |t|
    t.string   "summary"
    t.string   "from"
    t.string   "date"
    t.string   "number"
    t.string   "to"
    t.date     "due_on"
    t.string   "estimate_number"
    t.text     "estimate_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.string   "state"
    t.decimal  "amount"
  end

  add_index "estimates", ["user_id"], name: "index_estimates_on_user_id"

  create_table "invoices", force: true do |t|
    t.string   "summary"
    t.date     "date"
    t.string   "invoice_number"
    t.string   "invoice_due"
    t.string   "purchase_order_number"
    t.text     "invoice_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.string   "state"
    t.decimal  "amount"
  end

  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id"

  create_table "items", force: true do |t|
    t.text     "description"
    t.integer  "quantity"
    t.float    "rate"
    t.float    "amount"
    t.date     "date"
    t.string   "link"
    t.text     "tag_list"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "itemeable_type"
    t.integer  "itemeable_id"
    t.integer  "category_id"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.float    "hourly_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams_users", force: true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "subject"
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "currency"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.string   "website"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
