# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_05_223632) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "location"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "yarn_id"
    t.index ["yarn_id"], name: "index_chatrooms_on_yarn_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "yarn_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_favourites_on_user_id"
    t.index ["yarn_id"], name: "index_favourites_on_yarn_id"
  end

  create_table "gauge_swatches", force: :cascade do |t|
    t.string "image_url"
    t.string "gauge"
    t.string "needles"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_gauge_swatches_on_user_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "fiber_type"
    t.integer "percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yarn_gauge_swatches", force: :cascade do |t|
    t.bigint "gauge_swatch_id", null: false
    t.bigint "yarn_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gauge_swatch_id"], name: "index_yarn_gauge_swatches_on_gauge_swatch_id"
    t.index ["yarn_id"], name: "index_yarn_gauge_swatches_on_yarn_id"
  end

  create_table "yarn_materials", force: :cascade do |t|
    t.bigint "material_id", null: false
    t.bigint "yarn_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_yarn_materials_on_material_id"
    t.index ["yarn_id"], name: "index_yarn_materials_on_yarn_id"
  end

  create_table "yarns", force: :cascade do |t|
    t.string "name"
    t.string "weight"
    t.string "needles"
    t.string "gauge"
    t.string "price"
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "discontinued"
    t.string "image_url"
    t.index ["brand_id"], name: "index_yarns_on_brand_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chatrooms", "yarns"
  add_foreign_key "favourites", "users"
  add_foreign_key "favourites", "yarns"
  add_foreign_key "gauge_swatches", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "yarn_gauge_swatches", "gauge_swatches"
  add_foreign_key "yarn_gauge_swatches", "yarns"
  add_foreign_key "yarn_materials", "materials"
  add_foreign_key "yarn_materials", "yarns"
  add_foreign_key "yarns", "brands"
end
