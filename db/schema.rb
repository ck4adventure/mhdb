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

ActiveRecord::Schema.define(version: 2021_01_13_081219) do

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

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "item_exchanges", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "qty", default: 1, null: false
    t.integer "method", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_exchanges_on_item_id"
    t.index ["method"], name: "index_item_exchanges_on_method"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "itype", default: 8, null: false
    t.boolean "le", default: false, null: false
    t.integer "power_type"
    t.integer "power"
    t.integer "p_bonus"
    t.integer "attr_bonus"
    t.integer "luck"
    t.integer "cheese_effect"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["le"], name: "index_items_on_le"
    t.index ["name"], name: "index_items_on_name", unique: true
    t.index ["power_type"], name: "index_items_on_power_type"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.integer "rank_id", null: false
    t.integer "region_id", null: false
    t.boolean "trapsmith", default: false, null: false
    t.boolean "cheese_shoppe", default: false, null: false
    t.boolean "general_store", default: false, null: false
    t.boolean "charm_shoppe", default: false, null: false
    t.boolean "cartographer", default: false, null: false
    t.boolean "kings_cart", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_locations_on_name", unique: true
    t.index ["rank_id"], name: "index_locations_on_rank_id"
    t.index ["region_id"], name: "index_locations_on_region_id"
  end

  create_table "mice", force: :cascade do |t|
    t.string "name", null: false
    t.integer "points", null: false
    t.integer "gold", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_mice_on_group_id"
    t.index ["name"], name: "index_mice_on_name", unique: true
  end

  create_table "mouse_locations", force: :cascade do |t|
    t.integer "mouse_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_mouse_locations_on_location_id"
    t.index ["mouse_id", "location_id"], name: "index_mouse_locations_on_mouse_id_and_location_id", unique: true
    t.index ["mouse_id"], name: "index_mouse_locations_on_mouse_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_ranks_on_title", unique: true
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_regions_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "pw_hash", null: false
    t.string "session_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rank_id", default: 1, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
