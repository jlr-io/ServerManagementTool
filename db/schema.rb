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

ActiveRecord::Schema.define(version: 2018_11_13_205742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "database_structures", force: :cascade do |t|
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
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
