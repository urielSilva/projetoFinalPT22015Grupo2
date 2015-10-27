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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20151027182842) do
=======
ActiveRecord::Schema.define(version: 20151026154737) do
>>>>>>> 07b26b8ceda2cfe3e3d37e4db8bbde89dbf0becd

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
=======

  create_table "activities", force: :cascade do |t|

>>>>>>> 07b26b8ceda2cfe3e3d37e4db8bbde89dbf0becd
  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "knowledge_levels", force: :cascade do |t|
    t.string   "level"
    t.string   "description"
    t.integer  "credits"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

<<<<<<< HEAD
=======

>>>>>>> 07b26b8ceda2cfe3e3d37e4db8bbde89dbf0becd
  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
=======
  end

  create_table "knowledge_levels", force: :cascade do |t|
    t.string   "level"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
>>>>>>> 07b26b8ceda2cfe3e3d37e4db8bbde89dbf0becd
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "short_name"
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

end
