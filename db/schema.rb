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

ActiveRecord::Schema[7.0].define(version: 2024_10_29_223658) do
  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.integer "likes"
    t.integer "dislikes"
    t.integer "taps"
    t.string "author_name"
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.string "author_name"
    t.integer "chat_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.string "description"
    t.integer "likes"
    t.integer "dislikes"
    t.integer "taps"
    t.integer "author_name"
    t.integer "user_id", null: false
    t.integer "startup_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tags"
    t.boolean "public", default: false
    t.index ["startup_id"], name: "index_posts_on_startup_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "startups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tags"
    t.boolean "public", default: true
    t.index ["user_id"], name: "index_startups_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "tag_type_id"
    t.integer "user_id"
    t.integer "startup_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_tags_on_post_id"
    t.index ["startup_id"], name: "index_tags_on_startup_id"
    t.index ["tag_type_id"], name: "index_tags_on_tag_type_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tags"
    t.boolean "admin", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chats", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "posts", "startups"
  add_foreign_key "posts", "users"
  add_foreign_key "startups", "users"
  add_foreign_key "tags", "posts"
  add_foreign_key "tags", "startups"
  add_foreign_key "tags", "tag_types"
  add_foreign_key "tags", "users"
end
