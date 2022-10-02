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

ActiveRecord::Schema[7.0].define(version: 2022_10_02_212801) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.boolean "active"
    t.bigint "source_id"
    t.bigint "source_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_products_on_source_id"
    t.index ["source_page_id"], name: "index_products_on_source_page_id"
    t.index ["url"], name: "index_products_on_url", unique: true
  end

  create_table "source_pages", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.boolean "active"
    t.string "selectors"
    t.bigint "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_source_pages_on_source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "url_prefix"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
