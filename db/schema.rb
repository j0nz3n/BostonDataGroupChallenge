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

ActiveRecord::Schema.define(version: 20180929194233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_posters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_postings", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "category_id"
    t.bigint "job_poster_id"
    t.integer "status", default: 0, null: false
    t.text "description"
    t.datetime "posted_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", default: "", null: false
    t.index ["category_id"], name: "index_job_postings_on_category_id"
    t.index ["job_poster_id"], name: "index_job_postings_on_job_poster_id"
    t.index ["location_id"], name: "index_job_postings_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street_address_1", null: false
    t.string "street_address_2"
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "zip_code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zip_code"], name: "index_regions_on_zip_code"
  end

  add_foreign_key "job_postings", "categories"
  add_foreign_key "job_postings", "job_posters"
  add_foreign_key "job_postings", "locations"
end
