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

ActiveRecord::Schema.define(version: 20140729073325) do

  create_table "bills", force: true do |t|
    t.string   "summary"
    t.string   "from"
    t.date     "date"
    t.string   "bill_number"
    t.string   "to"
    t.string   "due_on"
    t.string   "purchase_order_number"
    t.text     "invoice_notes"
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
  end

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
  end

  create_table "invoices", force: true do |t|
    t.string   "summary"
    t.string   "from"
    t.date     "date"
    t.string   "invoice_number"
    t.string   "to"
    t.string   "invoice_due"
    t.string   "purchase_order_number"
    t.text     "invoice_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

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

  create_table "teams", force: true do |t|
    t.string   "name"
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
  end

end
