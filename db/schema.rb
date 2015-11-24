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

ActiveRecord::Schema.define(version: 20151120174653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "activity_description"
    t.integer  "activity_credit_number"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "areas", ["sector_id"], name: "index_areas_on_sector_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "knowledge_levels", force: :cascade do |t|
    t.string   "level"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "knowledges", force: :cascade do |t|
    t.string   "description"
    t.integer  "knowledge_level_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "knowledges", ["knowledge_level_id"], name: "index_knowledges_on_knowledge_level_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_statuses", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "description"
    t.float    "price"
    t.string   "link"
    t.integer  "project_status_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "projects", ["project_status_id"], name: "index_projects_on_project_status_id", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.string   "short_name"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_activities", force: :cascade do |t|
    t.string   "Type_Activity_description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.integer  "profile_id"
    t.integer  "job_id"
    t.string   "name"
    t.string   "last_name"
    t.integer  "sector_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["job_id"], name: "index_users_on_job_id", using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["sector_id"], name: "index_users_on_sector_id", using: :btree

  add_foreign_key "areas", "sectors"
  add_foreign_key "knowledges", "knowledge_levels"
  add_foreign_key "projects", "project_statuses"
  add_foreign_key "users", "jobs"
  add_foreign_key "users", "profiles"
  add_foreign_key "users", "sectors"
end
