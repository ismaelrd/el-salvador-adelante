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

ActiveRecord::Schema.define(version: 20131118223856) do

  create_table "articles", force: true do |t|
    t.boolean  "active",             default: true
    t.boolean  "featured",           default: false
    t.string   "name"
    t.text     "description"
    t.text     "content"
    t.datetime "published_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["active"], name: "index_articles_on_active", using: :btree
  add_index "articles", ["featured"], name: "index_articles_on_featured", using: :btree
  add_index "articles", ["name"], name: "index_articles_on_name", using: :btree
  add_index "articles", ["published_at"], name: "index_articles_on_published_at", using: :btree
  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "articles_tags", id: false, force: true do |t|
    t.integer "article_id"
    t.integer "tag_id"
  end

  add_index "articles_tags", ["article_id", "tag_id"], name: "index_articles_tags_on_article_id_and_tag_id", using: :btree

  create_table "assets", force: true do |t|
    t.boolean  "active",                  default: true
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.text     "data"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "priority",                default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["active"], name: "index_assets_on_active", using: :btree
  add_index "assets", ["assetable_id", "assetable_type"], name: "index_assets_on_assetable_id_and_assetable_type", using: :btree
  add_index "assets", ["priority"], name: "index_assets_on_priority", using: :btree
  add_index "assets", ["type"], name: "index_assets_on_type", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "content"
  end

  create_table "liabilities", force: true do |t|
    t.boolean  "active",             default: true
    t.integer  "priority",           default: 0
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.text     "content"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "liabilities", ["active"], name: "index_liabilities_on_active", using: :btree
  add_index "liabilities", ["category_id"], name: "index_liabilities_on_category_id", using: :btree
  add_index "liabilities", ["priority"], name: "index_liabilities_on_priority", using: :btree

  create_table "pages", force: true do |t|
    t.string   "ancestry"
    t.integer  "ancestry_depth", default: 0
    t.boolean  "active",         default: true
    t.integer  "priority",       default: 0
    t.string   "kind",           default: "page"
    t.string   "name"
    t.text     "description"
    t.text     "content"
    t.boolean  "in_menu",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["active"], name: "index_pages_on_active", using: :btree
  add_index "pages", ["ancestry"], name: "index_pages_on_ancestry", using: :btree
  add_index "pages", ["in_menu"], name: "index_pages_on_in_menu", using: :btree
  add_index "pages", ["priority"], name: "index_pages_on_priority", using: :btree

  create_table "posts", force: true do |t|
    t.boolean  "active",             default: true
    t.boolean  "featured",           default: false
    t.integer  "priority",           default: 0
    t.string   "name"
    t.text     "description"
    t.text     "content"
    t.datetime "published_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["active"], name: "index_posts_on_active", using: :btree
  add_index "posts", ["featured"], name: "index_posts_on_featured", using: :btree
  add_index "posts", ["name"], name: "index_posts_on_name", using: :btree
  add_index "posts", ["priority"], name: "index_posts_on_priority", using: :btree
  add_index "posts", ["published_at"], name: "index_posts_on_published_at", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "posts_tags", id: false, force: true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "posts_tags", ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id", using: :btree

  create_table "sponsors", force: true do |t|
    t.string   "kind",          default: "anonymous"
    t.string   "alias"
    t.string   "name"
    t.string   "document_type"
    t.string   "document"
    t.float    "amount"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sponsors", ["kind"], name: "index_sponsors_on_kind", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.boolean  "active",                 default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["active"], name: "index_users_on_active", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree

end
