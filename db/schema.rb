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

ActiveRecord::Schema.define(version: 20180412193615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hooks", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
  end

  create_table "hyperlinks", force: :cascade do |t|
    t.bigint "hook_id"
    t.string "url"
    t.string "title"
    t.string "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hook_id"], name: "index_hyperlinks_on_hook_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hook_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hook_id"], name: "index_impressions_on_hook_id"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hook_id"
    t.decimal "rating", precision: 3, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hook_id"], name: "index_interests_on_hook_id"
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hook_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hook_id"], name: "index_participations_on_hook_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "relations", force: :cascade do |t|
    t.string "type"
    t.bigint "hook_id"
    t.bigint "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_relations_on_child_id"
    t.index ["hook_id"], name: "index_relations_on_hook_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hyperlinks", "hooks"
  add_foreign_key "impressions", "hooks"
  add_foreign_key "impressions", "users"
  add_foreign_key "interests", "hooks"
  add_foreign_key "interests", "users"
  add_foreign_key "participations", "hooks"
  add_foreign_key "participations", "users"
  add_foreign_key "relations", "hooks"
  add_foreign_key "relations", "hooks", column: "child_id"
end
