# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_30_081234) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pose_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pose_id"], name: "index_bookmarks_on_pose_id"
    t.index ["user_id", "pose_id"], name: "index_bookmarks_on_user_id_and_pose_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "diaries", primary_key: "uuid", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "date"
    t.bigint "pose_id", null: false
    t.bigint "user_id", null: false
    t.string "compatibility"
    t.string "condition"
    t.string "feeling"
    t.string "sleep"
    t.text "memo"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pose_id"], name: "index_diaries_on_pose_id"
    t.index ["user_id"], name: "index_diaries_on_user_id"
    t.index ["uuid"], name: "index_diaries_on_uuid", unique: true
  end

  create_table "poses", force: :cascade do |t|
    t.string "japanese_name", null: false
    t.text "description", null: false
    t.text "benefit"
    t.text "tip"
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["japanese_name"], name: "index_poses_on_japanese_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.boolean "line_notification", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "poses"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "diaries", "poses"
  add_foreign_key "diaries", "users"
end
