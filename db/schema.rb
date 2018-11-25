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

ActiveRecord::Schema.define(version: 2018_11_20_203929) do

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "database_structures", force: :cascade do |t|
  end

  create_table "modifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "server_id"
    t.boolean "edit_server"
    t.boolean "delete_server"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "edit"
    t.boolean "delete"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servers", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "approved"
    t.string "hostname"
    t.string "location"
    t.string "environment"
    t.string "os_requested"
    t.string "disk_size"
    t.integer "eng_team_sme_contact_id"
    t.integer "eng_team_manager_contact_id"
    t.integer "application_sme_id"
    t.string "application_team_distro_group"
    t.integer "application_manager_id"
    t.integer "application_director_id"
    t.string "line_of_business"
    t.boolean "virtual_machine"
    t.string "asset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comments"
  end

  create_table "systems", force: :cascade do |t|
    t.integer "server_id"
    t.string "system"
    t.string "machine"
    t.string "cpu"
    t.string "graphics"
    t.string "drives"
    t.string "ip"
    t.string "boot_time"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
