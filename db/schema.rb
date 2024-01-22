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

ActiveRecord::Schema[7.0].define(version: 2024_01_21_141831) do
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

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_amenities_on_name", unique: true
  end

  create_table "beds", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.integer "bed_size"
    t.integer "number_of_bed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_beds_on_room_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_facilities_on_name", unique: true
  end

  create_table "listing_amenities", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "amenity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_listing_amenities_on_amenity_id"
    t.index ["listing_id"], name: "index_listing_amenities_on_listing_id"
  end

  create_table "listing_facilities", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "facility_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_listing_facilities_on_facility_id"
    t.index ["listing_id"], name: "index_listing_facilities_on_listing_id"
  end

  create_table "listing_suitabilities", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "suitability_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_listing_suitabilities_on_listing_id"
    t.index ["suitability_id"], name: "index_listing_suitabilities_on_suitability_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "host_id", null: false
    t.string "title", null: false
    t.text "about"
    t.integer "max_guests", default: 1
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.integer "status", default: 0
    t.integer "listing_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "furniture", default: 0
    t.integer "size"
    t.index ["host_id"], name: "index_listings_on_host_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.integer "room_type"
    t.integer "number_of_room", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_rooms_on_listing_id"
  end

  create_table "suitabilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_suitabilities_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", null: false
    t.string "firstname", null: false
    t.string "surname", null: false
    t.string "admin", default: "f"
    t.string "location"
    t.string "ywam_base"
    t.string "bio"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "beds", "rooms"
  add_foreign_key "listing_amenities", "amenities"
  add_foreign_key "listing_amenities", "listings"
  add_foreign_key "listing_facilities", "facilities"
  add_foreign_key "listing_facilities", "listings"
  add_foreign_key "listing_suitabilities", "listings"
  add_foreign_key "listing_suitabilities", "suitabilities"
  add_foreign_key "listings", "users", column: "host_id"
  add_foreign_key "rooms", "listings"
end
