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

ActiveRecord::Schema.define(version: 20171114135250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar"
    t.string "type", null: false
    t.string "address", null: false
    t.string "phone_number"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "facebook_website"
    t.string "homepage_website"
    t.index ["deleted_at"], name: "index_accounts_on_deleted_at"
  end

  create_table "accounts_users", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "user_id", null: false
    t.index ["account_id", "user_id"], name: "index_accounts_users_on_account_id_and_user_id", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.datetime "deleted_at"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
    t.index ["deleted_at"], name: "index_categories_on_deleted_at"
    t.index ["name"], name: "index_categories_on_name", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "categories_projects", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "project_id", null: false
    t.index ["category_id", "project_id"], name: "index_categories_projects_on_category_id_and_project_id", unique: true
  end

  create_table "engagements", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "resource_id", null: false
    t.text "description"
    t.float "quantity"
    t.string "provider_type", null: false
    t.bigint "provider_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0
    t.index ["project_id", "provider_type"], name: "index_engagements_on_project_id_and_provider_type"
    t.index ["project_id", "resource_id", "provider_id", "provider_type"], name: "index_projects_resources_unique_provider", unique: true
    t.index ["project_id"], name: "index_engagements_on_project_id"
    t.index ["resource_id"], name: "index_engagements_on_resource_id"
  end

  create_table "founders", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "member_type", null: false
    t.bigint "member_id", null: false
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id", "member_type", "project_id"], name: "index_founders_on_member_id_and_member_type_and_project_id", unique: true
    t.index ["member_type", "member_id"], name: "index_founders_on_member_type_and_member_id"
    t.index ["project_id"], name: "index_founders_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: false, null: false
    t.string "video_url"
    t.text "description_html", null: false
    t.jsonb "images"
    t.date "finish_on", null: false
    t.string "location", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "city", default: "krakow", null: false
    t.float "required_budget"
    t.float "collected_budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_projects_on_deleted_at"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name", null: false
    t.integer "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_resources_on_deleted_at"
    t.index ["name"], name: "index_resources_on_name", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "super_admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_super_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_super_admins_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_super_admins_on_unlock_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "avatar"
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.boolean "volunteer", default: true, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "biography"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.datetime "deleted_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, where: "(deleted_at IS NULL)"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true, where: "(deleted_at IS NULL)"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, where: "(deleted_at IS NULL)"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, where: "(deleted_at IS NULL)"
  end

  add_foreign_key "engagements", "projects"
  add_foreign_key "engagements", "resources"
  add_foreign_key "founders", "projects"
end
