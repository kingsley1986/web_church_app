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

ActiveRecord::Schema.define(version: 20170421084231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "post_id"
    t.integer  "user_id"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "homes", force: :cascade do |t|
    t.string   "body"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imagegalleries", force: :cascade do |t|
    t.string   "image"
    t.string   "image_title"
    t.string   "image_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "likes", force: :cascade do |t|
    t.boolean  "like"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "comment_id"
  end

  add_index "likes", ["comment_id"], name: "index_likes_on_comment_id", using: :btree
  add_index "likes", ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id", using: :btree
  add_index "likes", ["post_id"], name: "index_likes_on_post_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "body"
    t.string   "page_type"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "image"
    t.integer  "user_id"
    t.integer  "picturable_id"
    t.string   "picturable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "post_id"
    t.integer  "comment_id"
  end

  add_index "pictures", ["comment_id"], name: "index_pictures_on_comment_id", using: :btree
  add_index "pictures", ["picturable_type", "picturable_id"], name: "index_pictures_on_picturable_type_and_picturable_id", using: :btree
  add_index "pictures", ["post_id"], name: "index_pictures_on_post_id", using: :btree
  add_index "pictures", ["user_id"], name: "index_pictures_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "post_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "replies", force: :cascade do |t|
    t.string   "reply_body"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "replies", ["comment_id"], name: "index_replies_on_comment_id", using: :btree
  add_index "replies", ["user_id"], name: "index_replies_on_user_id", using: :btree

  create_table "upcoming_events", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "starting_from"
    t.datetime "ending_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "gender"
    t.boolean  "admin"
    t.jsonb    "roles",                  default: []
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "pictures", "comments"
  add_foreign_key "pictures", "posts"
  add_foreign_key "pictures", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "replies", "comments"
  add_foreign_key "replies", "users"
end
