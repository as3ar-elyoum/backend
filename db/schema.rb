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

ActiveRecord::Schema[7.0].define(version: 2022_11_08_134605) do
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "device_id"
    t.string "fcm_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_logs", force: :cascade do |t|
    t.string "notes"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_logs_on_product_id"
  end

  create_table "product_prices", force: :cascade do |t|
    t.bigint "product_id"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_prices_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "image_url"
    t.text "description"
    t.datetime "scraped_at"
    t.decimal "price"
    t.bigint "source_id"
    t.bigint "source_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unique_identifier"
    t.integer "status"
    t.index ["source_id"], name: "index_products_on_source_id"
    t.index ["source_page_id"], name: "index_products_on_source_page_id"
    t.index ["status"], name: "index_products_on_status"
    t.index ["unique_identifier"], name: "index_products_on_unique_identifier", unique: true
    t.index ["url"], name: "index_products_on_url", unique: true
  end

  create_table "source_config_tables", force: :cascade do |t|
    t.string "price_selector"
    t.string "name_selector"
    t.string "image_selector"
    t.string "description_selector"
    t.string "product_urls_selector"
    t.bigint "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_source_config_tables_on_source_id"
  end

  create_table "source_page_logs", force: :cascade do |t|
    t.string "notes"
    t.bigint "source_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_page_id"], name: "index_source_page_logs_on_source_page_id"
  end

  create_table "source_pages", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.boolean "active"
    t.bigint "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.datetime "scraped_at"
    t.boolean "paginated", default: false
    t.integer "max_page_numbers", default: 0
    t.index ["category_id"], name: "index_source_pages_on_category_id"
    t.index ["source_id"], name: "index_source_pages_on_source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "url_prefix"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "selectors"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
