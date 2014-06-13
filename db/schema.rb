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

ActiveRecord::Schema.define(version: 20140613082451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: true do |t|
    t.string   "key"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", using: :btree

  create_table "categorizations", force: true do |t|
    t.integer  "post_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["post_id"], name: "index_categorizations_on_post_id", using: :btree

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.time     "pause"
    t.boolean  "vacation",   default: false
    t.boolean  "sick",       default: false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["store_id"], name: "index_events_on_store_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "post_images", force: true do |t|
    t.integer  "post_id"
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "post_images", ["post_id"], name: "index_post_images_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.boolean  "is_published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.boolean  "is_on_homepage"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", using: :btree

  create_table "product_categories", force: true do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
  end

  add_index "product_categories", ["depth"], name: "index_product_categories_on_depth", using: :btree
  add_index "product_categories", ["lft"], name: "index_product_categories_on_lft", using: :btree
  add_index "product_categories", ["parent_id"], name: "index_product_categories_on_parent_id", using: :btree
  add_index "product_categories", ["rgt"], name: "index_product_categories_on_rgt", using: :btree

  create_table "product_categorizations", force: true do |t|
    t.integer  "product_id"
    t.integer  "product_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_categorizations", ["product_category_id"], name: "index_product_categorizations_on_product_category_id", using: :btree
  add_index "product_categorizations", ["product_id"], name: "index_product_categorizations_on_product_id", using: :btree

  create_table "product_images", force: true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",            default: false, null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "sku"
    t.text     "description",                                  default: "Beschreibung folgt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size_id"
    t.integer  "brand_id"
    t.decimal  "regular_price",        precision: 8, scale: 2
    t.decimal  "current_price",        precision: 8, scale: 2
    t.string   "color"
    t.boolean  "is_published"
    t.text     "official_description"
    t.boolean  "is_on_sale"
    t.boolean  "is_on_frontpage"
    t.boolean  "is_featured"
    t.string   "slug"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["size_id"], name: "index_products_on_size_id", using: :btree
  add_index "products", ["slug"], name: "index_products_on_slug", using: :btree

  create_table "properties", force: true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["product_id"], name: "index_properties_on_product_id", using: :btree

  create_table "sizes", force: true do |t|
    t.string   "name"
    t.string   "g1"
    t.string   "g1h"
    t.string   "g2"
    t.string   "g2h"
    t.string   "g3"
    t.string   "g3h"
    t.string   "g4"
    t.string   "g4h"
    t.string   "g5"
    t.string   "g5h"
    t.string   "g6"
    t.string   "g6h"
    t.string   "g7"
    t.string   "g7h"
    t.string   "g8"
    t.string   "g8h"
    t.string   "g9"
    t.string   "g9h"
    t.string   "g10"
    t.string   "g10h"
    t.string   "g11"
    t.string   "g11h"
    t.string   "g12"
    t.string   "g12h"
    t.string   "g13"
    t.string   "g13h"
    t.string   "g14"
    t.string   "g14h"
    t.string   "g15"
    t.string   "g16"
    t.string   "g17"
    t.string   "g18"
    t.string   "g19"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stocks", force: true do |t|
    t.integer  "product_id"
    t.integer  "store_id"
    t.integer  "g1"
    t.integer  "g1h"
    t.integer  "g2"
    t.integer  "g2h"
    t.integer  "g3"
    t.integer  "g3h"
    t.integer  "g4"
    t.integer  "g4h"
    t.integer  "g5"
    t.integer  "g5h"
    t.integer  "g6"
    t.integer  "g6h"
    t.integer  "g7"
    t.integer  "g7h"
    t.integer  "g8"
    t.integer  "g8h"
    t.integer  "g9"
    t.integer  "g9h"
    t.integer  "g10"
    t.integer  "g10h"
    t.integer  "g11"
    t.integer  "g11h"
    t.integer  "g12"
    t.integer  "g12h"
    t.integer  "g13"
    t.integer  "g13h"
    t.integer  "g14"
    t.integer  "g14h"
    t.integer  "g15"
    t.integer  "g16"
    t.integer  "g17"
    t.integer  "g18"
    t.integer  "g19"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stocks", ["product_id"], name: "index_stocks_on_product_id", using: :btree
  add_index "stocks", ["store_id"], name: "index_stocks_on_store_id", using: :btree

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "address_name"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "phone"
    t.string   "email"
    t.boolean  "active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
