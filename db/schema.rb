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

ActiveRecord::Schema[7.1].define(version: 2024_01_19_091412) do
  create_table "active_admin_comments", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.boolean "cover", default: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
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

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "brands", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "business_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_brands_on_business_id"
  end

  create_table "businesses", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 20
    t.bigint "city_id", null: false
    t.bigint "state_id", null: false
    t.bigint "country_id", null: false
    t.string "email"
    t.string "mobile", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pincode"
    t.text "street"
    t.string "landmark"
    t.index ["city_id"], name: "index_businesses_on_city_id"
    t.index ["country_id"], name: "index_businesses_on_country_id"
    t.index ["state_id"], name: "index_businesses_on_state_id"
  end

  create_table "carts", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_carts_on_customer_id"
    t.index ["product_id"], name: "index_carts_on_product_id"
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 20
    t.text "description", size: :tiny
    t.bigint "business_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_categories_on_business_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "state_id", null: false
    t.string "name", limit: 20
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 20
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "first_name", limit: 50
    t.string "middle_name", limit: 50
    t.string "last_name", limit: 50
    t.string "email", limit: 50
    t.string "mobile", limit: 25
    t.text "street", size: :tiny
    t.string "landmark", limit: 50
    t.integer "pincode"
    t.bigint "city_id", null: false
    t.bigint "state_id", null: false
    t.bigint "country_id", null: false
    t.bigint "business_id", null: false
    t.string "password", limit: 50
    t.string "conform_password", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["business_id"], name: "index_customers_on_business_id"
    t.index ["city_id"], name: "index_customers_on_city_id"
    t.index ["country_id"], name: "index_customers_on_country_id"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    t.index ["state_id"], name: "index_customers_on_state_id"
  end

  create_table "order_products", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.integer "mrp"
    t.string "discount_type"
    t.integer "discount_value"
    t.float "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_order_products_on_customer_id"
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.text "street", size: :tiny
    t.integer "pincode"
    t.string "landmark"
    t.bigint "city_id", null: false
    t.bigint "state_id", null: false
    t.bigint "country_id", null: false
    t.string "mobile", limit: 25
    t.string "status"
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cancel_by"
    t.string "cancel_reason"
    t.string "delivery_notes"
    t.string "payment_details"
    t.decimal "sub_total", precision: 10
    t.string "discount_type"
    t.decimal "discount_value", precision: 10
    t.decimal "total", precision: 10
    t.index ["city_id"], name: "index_orders_on_city_id"
    t.index ["country_id"], name: "index_orders_on_country_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["state_id"], name: "index_orders_on_state_id"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "mrp"
    t.string "discount_type"
    t.integer "discount_value"
    t.float "price"
    t.string "image"
    t.bigint "category_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "business_id", null: false
    t.boolean "active"
    t.string "availability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["business_id"], name: "index_products_on_business_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "states", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.string "name", limit: 20
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "brands", "businesses"
  add_foreign_key "businesses", "cities"
  add_foreign_key "businesses", "countries"
  add_foreign_key "businesses", "states"
  add_foreign_key "carts", "customers"
  add_foreign_key "carts", "products"
  add_foreign_key "categories", "businesses"
  add_foreign_key "cities", "states"
  add_foreign_key "customers", "businesses"
  add_foreign_key "customers", "cities"
  add_foreign_key "customers", "countries"
  add_foreign_key "customers", "states"
  add_foreign_key "order_products", "customers"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "cities"
  add_foreign_key "orders", "countries"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "states"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "businesses"
  add_foreign_key "products", "categories"
  add_foreign_key "states", "countries"
end
