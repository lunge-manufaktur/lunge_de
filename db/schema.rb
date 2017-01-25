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

ActiveRecord::Schema.define(version: 20170124110543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_api_keys_on_user_id", using: :btree
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "slug",              limit: 255
    t.index ["slug"], name: "index_brands_on_slug", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "slug",       limit: 255
    t.index ["slug"], name: "index_categories_on_slug", using: :btree
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_categorizations_on_category_id", using: :btree
    t.index ["post_id"], name: "index_categorizations_on_post_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",                 default: true
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["active"], name: "index_employees_on_active", using: :btree
    t.index ["user_id"], name: "index_employees_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "store_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.time     "pause"
    t.boolean  "vacation",                  default: false
    t.boolean  "sick",                      default: false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "custom_status", limit: 255
    t.boolean  "manager",                   default: false
    t.index ["employee_id"], name: "index_events_on_employee_id", using: :btree
    t.index ["store_id"], name: "index_events_on_store_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "post_images", force: :cascade do |t|
    t.integer  "post_id"
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["post_id"], name: "index_post_images_on_post_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "subtitle",          limit: 255
    t.text     "content"
    t.boolean  "is_published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",              limit: 255
    t.boolean  "is_on_homepage"
    t.string   "icon_file_name",    limit: 255
    t.string   "icon_content_type", limit: 255
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.boolean  "is_featured"
    t.index ["is_featured"], name: "index_posts_on_is_featured", using: :btree
    t.index ["slug"], name: "index_posts_on_slug", using: :btree
  end

  create_table "product_categories", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.index ["depth"], name: "index_product_categories_on_depth", using: :btree
    t.index ["lft"], name: "index_product_categories_on_lft", using: :btree
    t.index ["parent_id"], name: "index_product_categories_on_parent_id", using: :btree
    t.index ["rgt"], name: "index_product_categories_on_rgt", using: :btree
  end

  create_table "product_categorizations", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "product_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_category_id"], name: "index_product_categorizations_on_product_category_id", using: :btree
    t.index ["product_id"], name: "index_product_categorizations_on_product_id", using: :btree
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",                        default: false, null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image"
    t.index ["product_id"], name: "index_product_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "sku",                  limit: 255
    t.text     "description",                                              default: "Beschreibung folgt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size_id"
    t.integer  "brand_id"
    t.decimal  "regular_price",                    precision: 8, scale: 2
    t.decimal  "current_price",                    precision: 8, scale: 2
    t.string   "color",                limit: 255
    t.boolean  "is_published"
    t.text     "official_description"
    t.boolean  "is_on_sale"
    t.boolean  "is_on_frontpage"
    t.boolean  "is_featured"
    t.string   "slug",                 limit: 255
    t.boolean  "use_in_lia_campaign",                                      default: false
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["size_id"], name: "index_products_on_size_id", using: :btree
    t.index ["slug"], name: "index_products_on_slug", using: :btree
    t.index ["use_in_lia_campaign"], name: "index_products_on_use_in_lia_campaign", using: :btree
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "index_properties_on_product_id", using: :btree
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "g1",         limit: 255
    t.string   "g1h",        limit: 255
    t.string   "g2",         limit: 255
    t.string   "g2h",        limit: 255
    t.string   "g3",         limit: 255
    t.string   "g3h",        limit: 255
    t.string   "g4",         limit: 255
    t.string   "g4h",        limit: 255
    t.string   "g5",         limit: 255
    t.string   "g5h",        limit: 255
    t.string   "g6",         limit: 255
    t.string   "g6h",        limit: 255
    t.string   "g7",         limit: 255
    t.string   "g7h",        limit: 255
    t.string   "g8",         limit: 255
    t.string   "g8h",        limit: 255
    t.string   "g9",         limit: 255
    t.string   "g9h",        limit: 255
    t.string   "g10",        limit: 255
    t.string   "g10h",       limit: 255
    t.string   "g11",        limit: 255
    t.string   "g11h",       limit: 255
    t.string   "g12",        limit: 255
    t.string   "g12h",       limit: 255
    t.string   "g13",        limit: 255
    t.string   "g13h",       limit: 255
    t.string   "g14",        limit: 255
    t.string   "g14h",       limit: 255
    t.string   "g15",        limit: 255
    t.string   "g16",        limit: 255
    t.string   "g17",        limit: 255
    t.string   "g18",        limit: 255
    t.string   "g19",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stocks", force: :cascade do |t|
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
    t.index ["product_id"], name: "index_stocks_on_product_id", using: :btree
    t.index ["store_id"], name: "index_stocks_on_store_id", using: :btree
  end

  create_table "store_images", force: :cascade do |t|
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["store_id"], name: "index_store_images_on_store_id", using: :btree
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "address_name",         limit: 255
    t.string   "street",               limit: 255
    t.string   "zip",                  limit: 255
    t.string   "city",                 limit: 255
    t.string   "phone",                limit: 255
    t.string   "email",                limit: 255
    t.boolean  "active",                           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.string   "slug",                 limit: 255
    t.string   "google_maps_place_id"
    t.index ["slug"], name: "index_stores_on_slug", unique: true, using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count",             default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
