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

ActiveRecord::Schema.define(version: 20151210184334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "description"
    t.integer  "credit_numbers"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "activity_type_id"
  end

  add_index "activities", ["activity_type_id"], name: "index_activities_on_activity_type_id", using: :btree

  create_table "activities_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activities_users", ["activity_id"], name: "index_activities_users_on_activity_id", using: :btree
  add_index "activities_users", ["user_id"], name: "index_activities_users_on_user_id", using: :btree

  create_table "activity_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "knowledge_requests", force: :cascade do |t|
    t.integer  "knowledge_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "request_status_id"
  end

  add_index "knowledge_requests", ["knowledge_id"], name: "index_knowledge_requests_on_knowledge_id", using: :btree
  add_index "knowledge_requests", ["request_status_id"], name: "index_knowledge_requests_on_request_status_id", using: :btree
  add_index "knowledge_requests", ["user_id"], name: "index_knowledge_requests_on_user_id", using: :btree

  create_table "knowledges", force: :cascade do |t|
    t.string   "description"
    t.integer  "knowledge_level_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "technology_id"
  end

  add_index "knowledges", ["knowledge_level_id"], name: "index_knowledges_on_knowledge_level_id", using: :btree
  add_index "knowledges", ["technology_id"], name: "index_knowledges_on_technology_id", using: :btree

  create_table "knowledges_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "knowledge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "knowledges_users", ["knowledge_id"], name: "index_knowledges_users_on_knowledge_id", using: :btree
  add_index "knowledges_users", ["user_id"], name: "index_knowledges_users_on_user_id", using: :btree

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_histories", force: :cascade do |t|
    t.text     "observation"
    t.integer  "project_id"
    t.integer  "project_status_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "project_histories", ["project_id"], name: "index_project_histories_on_project_id", using: :btree
  add_index "project_histories", ["project_status_id"], name: "index_project_histories_on_project_status_id", using: :btree

  create_table "project_member_histories", force: :cascade do |t|
    t.text     "observation"
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "project_role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "project_member_histories", ["project_id"], name: "index_project_member_histories_on_project_id", using: :btree
  add_index "project_member_histories", ["project_role_id"], name: "index_project_member_histories_on_project_role_id", using: :btree
  add_index "project_member_histories", ["user_id"], name: "index_project_member_histories_on_user_id", using: :btree

  create_table "project_roles", force: :cascade do |t|
    t.string   "role"
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
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "projects", ["project_status_id"], name: "index_projects_on_project_status_id", using: :btree

  create_table "projects_users", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "project_role_id"
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id", using: :btree
  add_index "projects_users", ["project_role_id"], name: "index_projects_users_on_project_role_id", using: :btree
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id", using: :btree

  create_table "request_histories", force: :cascade do |t|
    t.integer  "knowledge_request_id"
    t.text     "observation"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "request_histories", ["knowledge_request_id"], name: "index_request_histories_on_knowledge_request_id", using: :btree

  create_table "request_statuses", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "user_statuses", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer  "user_status_id"
    t.integer  "area_id"
  end

  add_index "users", ["area_id"], name: "index_users_on_area_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["job_id"], name: "index_users_on_job_id", using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["sector_id"], name: "index_users_on_sector_id", using: :btree
  add_index "users", ["user_status_id"], name: "index_users_on_user_status_id", using: :btree

  add_foreign_key "activities", "activity_types"
  add_foreign_key "activities_users", "activities"
  add_foreign_key "activities_users", "users"
  add_foreign_key "areas", "sectors"
  add_foreign_key "knowledge_requests", "knowledges"
  add_foreign_key "knowledge_requests", "request_statuses"
  add_foreign_key "knowledge_requests", "users"
  add_foreign_key "knowledges", "knowledge_levels"
  add_foreign_key "knowledges", "technologies"
  add_foreign_key "knowledges_users", "knowledges"
  add_foreign_key "knowledges_users", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "project_histories", "project_statuses"
  add_foreign_key "project_histories", "projects"
  add_foreign_key "project_member_histories", "project_roles"
  add_foreign_key "project_member_histories", "projects"
  add_foreign_key "project_member_histories", "users"
  add_foreign_key "projects", "project_statuses"
  add_foreign_key "projects_users", "project_roles"
  add_foreign_key "projects_users", "projects"
  add_foreign_key "projects_users", "users"
  add_foreign_key "request_histories", "knowledge_requests"
  add_foreign_key "users", "areas"
  add_foreign_key "users", "jobs"
  add_foreign_key "users", "profiles"
  add_foreign_key "users", "sectors"
  add_foreign_key "users", "user_statuses"
end
