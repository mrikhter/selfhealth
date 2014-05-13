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

ActiveRecord::Schema.define(version: 20140513180535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: true do |t|
    t.integer  "test_id",           null: false
    t.string   "full_name",         null: false
    t.string   "short_name"
    t.boolean  "depends_on_age",    null: false
    t.boolean  "depends_on_gender", null: false
    t.string   "units",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["test_id"], name: "index_items_on_test_id", using: :btree

  create_table "laboratories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "normal_ranges", force: true do |t|
    t.integer  "item_id",       null: false
    t.string   "gender"
    t.integer  "low_age"
    t.integer  "high_age"
    t.float    "low"
    t.float    "high"
    t.integer  "laboratory_id", null: false
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "normal_ranges", ["item_id"], name: "index_normal_ranges_on_item_id", using: :btree

  create_table "results", force: true do |t|
    t.integer  "user_test_id", null: false
    t.integer  "item_id",      null: false
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["item_id"], name: "index_results_on_item_id", using: :btree
  add_index "results", ["user_test_id", "item_id"], name: "index_results_on_user_test_id_and_item_id", unique: true, using: :btree
  add_index "results", ["user_test_id"], name: "index_results_on_user_test_id", using: :btree

  create_table "test_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", force: true do |t|
    t.string   "full_name"
    t.integer  "cpt_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
    t.integer  "test_type_id", null: false
  end

  create_table "user_tests", force: true do |t|
    t.integer  "user_id",       null: false
    t.integer  "test_id",       null: false
    t.integer  "laboratory_id"
    t.integer  "doctor_id"
    t.date     "test_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_tests", ["laboratory_id"], name: "index_user_tests_on_laboratory_id", using: :btree
  add_index "user_tests", ["test_id"], name: "index_user_tests_on_test_id", using: :btree
  add_index "user_tests", ["user_id"], name: "index_user_tests_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",                    null: false
    t.string   "last_name",                     null: false
    t.string   "email",                         null: false
    t.integer  "gender",                        null: false
    t.date     "dob",                           null: false
    t.integer  "age",                           null: false
    t.integer  "zip",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "admin",         default: false
  end

  add_foreign_key "items", "tests", name: "items_test_id_fk", dependent: :delete

  add_foreign_key "normal_ranges", "items", name: "normal_ranges_item_id_fk", dependent: :delete

  add_foreign_key "results", "items", name: "results_item_id_fk"
  add_foreign_key "results", "user_tests", name: "results_user_test_id_fk"

  add_foreign_key "tests", "test_types", name: "tests_test_type_id_fk"

  add_foreign_key "user_tests", "laboratories", name: "user_tests_laboratory_id_fk"
  add_foreign_key "user_tests", "tests", name: "user_tests_test_id_fk"
  add_foreign_key "user_tests", "users", name: "user_tests_user_id_fk"

end
