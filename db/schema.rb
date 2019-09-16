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

ActiveRecord::Schema.define(version: 2019_09_16_111043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "total_members"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "department"
    t.date "event_date"
    t.string "event_name"
    t.text "event_description"
    t.text "event_guest"
    t.text "event_venue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaders", force: :cascade do |t|
    t.string "department"
    t.string "title"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_leaders_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "contacts"
    t.string "residence"
    t.date "join_date"
    t.boolean "born_again"
    t.boolean "spirit_filled"
    t.text "departments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.date "service_date"
    t.integer "total_attendants"
    t.integer "total_new_coverts"
    t.text "sunday_school_teachers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tithes", force: :cascade do |t|
    t.string "name"
    t.string "contacts"
    t.date "tithe_date"
    t.boolean "member"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "leaders", "members"
end
