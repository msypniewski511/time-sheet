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

ActiveRecord::Schema.define(version: 20170121073828) do

  create_table "departments", force: :cascade do |t|
    t.string   "nazwa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.integer  "shift_id"
    t.integer  "status_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
  end

  create_table "grafiks", force: :cascade do |t|
    t.string   "nazwa"
    t.string   "dane"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "shift_id"
  end

  create_table "option_shifts", force: :cascade do |t|
    t.string   "option"
    t.string   "color"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.string   "nazwa"
    t.integer  "grafik_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "nazwa"
    t.integer  "uprawnienia"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
