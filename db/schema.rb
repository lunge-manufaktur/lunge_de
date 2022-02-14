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

ActiveRecord::Schema.define(version: 2022_02_14_073416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "key"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.bigint "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "slug"
    t.text "description"
    t.index ["slug"], name: "index_brands_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "slug"
    t.index ["slug"], name: "index_categories_on_slug"
  end

  create_table "categorizations", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categorizations_on_category_id"
    t.index ["post_id"], name: "index_categorizations_on_post_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_employees_on_active"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "store_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.time "pause"
    t.boolean "vacation", default: false
    t.boolean "sick", default: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "custom_status"
    t.boolean "manager", default: false
    t.index ["employee_id"], name: "index_events_on_employee_id"
    t.index ["store_id"], name: "index_events_on_store_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "post_images", force: :cascade do |t|
    t.bigint "post_id"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["post_id"], name: "index_post_images_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.boolean "is_published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.boolean "is_on_homepage"
    t.string "icon_file_name"
    t.string "icon_content_type"
    t.bigint "icon_file_size"
    t.datetime "icon_updated_at"
    t.boolean "is_featured"
    t.text "meta_description"
    t.string "frontend_url"
    t.index ["is_featured"], name: "index_posts_on_is_featured"
    t.index ["slug"], name: "index_posts_on_slug"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.index ["depth"], name: "index_product_categories_on_depth"
    t.index ["lft"], name: "index_product_categories_on_lft"
    t.index ["parent_id"], name: "index_product_categories_on_parent_id"
    t.index ["rgt"], name: "index_product_categories_on_rgt"
  end

  create_table "product_categorizations", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "product_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_product_categorizations_on_product_category_id"
    t.index ["product_id"], name: "index_product_categorizations_on_product_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false, null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.string "image"
    t.index ["default"], name: "index_product_images_on_default"
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "fmid"
    t.string "sku"
    t.text "description", default: "Beschreibung folgt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "size_id"
    t.bigint "brand_id"
    t.decimal "regular_price", precision: 8, scale: 2
    t.decimal "current_price", precision: 8, scale: 2
    t.string "color"
    t.boolean "is_published", default: false
    t.text "official_description"
    t.boolean "is_on_frontpage", default: false
    t.boolean "is_featured", default: false
    t.string "slug"
    t.boolean "use_in_lia_campaign", default: false
    t.text "meta_description"
    t.decimal "current_price_without_tax_reduction", precision: 8, scale: 2
    t.boolean "orderable", default: true, null: false
    t.boolean "is_archived", default: false
    t.datetime "published_at"
    t.integer "sales_over_90_days"
    t.boolean "is_on_supersale", default: false
    t.boolean "is_exclusive", default: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["is_archived"], name: "index_products_on_is_archived"
    t.index ["is_exclusive"], name: "index_products_on_is_exclusive"
    t.index ["is_featured"], name: "index_products_on_is_featured"
    t.index ["is_on_frontpage"], name: "index_products_on_is_on_frontpage"
    t.index ["is_on_supersale"], name: "index_products_on_is_on_supersale"
    t.index ["is_published"], name: "index_products_on_is_published"
    t.index ["orderable"], name: "index_products_on_orderable"
    t.index ["published_at"], name: "index_products_on_published_at"
    t.index ["sales_over_90_days"], name: "index_products_on_sales_over_90_days"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["slug"], name: "index_products_on_slug"
    t.index ["use_in_lia_campaign"], name: "index_products_on_use_in_lia_campaign"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "product_id"
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_properties_on_product_id"
  end

  create_table "sizes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "g1"
    t.string "g1h"
    t.string "g2"
    t.string "g2h"
    t.string "g3"
    t.string "g3h"
    t.string "g4"
    t.string "g4h"
    t.string "g5"
    t.string "g5h"
    t.string "g6"
    t.string "g6h"
    t.string "g7"
    t.string "g7h"
    t.string "g8"
    t.string "g8h"
    t.string "g9"
    t.string "g9h"
    t.string "g10"
    t.string "g10h"
    t.string "g11"
    t.string "g11h"
    t.string "g12"
    t.string "g12h"
    t.string "g13"
    t.string "g13h"
    t.string "g14"
    t.string "g14h"
    t.string "g15"
    t.string "g16"
    t.string "g17"
    t.string "g18"
    t.string "g19"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "store_id"
    t.integer "g1"
    t.integer "g1h"
    t.integer "g2"
    t.integer "g2h"
    t.integer "g3"
    t.integer "g3h"
    t.integer "g4"
    t.integer "g4h"
    t.integer "g5"
    t.integer "g5h"
    t.integer "g6"
    t.integer "g6h"
    t.integer "g7"
    t.integer "g7h"
    t.integer "g8"
    t.integer "g8h"
    t.integer "g9"
    t.integer "g9h"
    t.integer "g10"
    t.integer "g10h"
    t.integer "g11"
    t.integer "g11h"
    t.integer "g12"
    t.integer "g12h"
    t.integer "g13"
    t.integer "g13h"
    t.integer "g14"
    t.integer "g14h"
    t.integer "g15"
    t.integer "g16"
    t.integer "g17"
    t.integer "g18"
    t.integer "g19"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_stocks_on_product_id"
    t.index ["store_id"], name: "index_stocks_on_store_id"
  end

  create_table "store_images", force: :cascade do |t|
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "default", default: false
    t.index ["default"], name: "index_store_images_on_default"
    t.index ["store_id"], name: "index_store_images_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "address_name"
    t.string "street"
    t.string "zip"
    t.string "city"
    t.string "phone"
    t.string "email"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.string "slug"
    t.string "google_maps_place_id"
    t.text "panorama_embed_url"
    t.string "frontend_url"
    t.index ["slug"], name: "index_stores_on_slug", unique: true
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
