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

ActiveRecord::Schema.define(version: 2019_08_16_154917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.text "article_type"
    t.text "short_description"
    t.text "description"
    t.datetime "creation_date"
    t.decimal "price", precision: 6, scale: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.string "stripe_customer_id"
    t.bigint "attendee_id"
    t.bigint "attended_event_id"
    t.index ["attended_event_id"], name: "index_attendances_on_attended_event_id"
    t.index ["attendee_id"], name: "index_attendances_on_attendee_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_date"
    t.integer "duration"
    t.string "title"
    t.text "description"
    t.integer "price"
    t.string "location"
    t.bigint "owner_id"
    t.index ["owner_id"], name: "index_events_on_owner_id"
  end

  create_table "sub_articles", force: :cascade do |t|
    t.string "sub_article_type"
    t.datetime "creation_date"
    t.decimal "price", precision: 6, scale: 1
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_sub_articles_on_article_id"
  end

  create_table "tags", force: :cascade do |t|
    t.text "content"
    t.integer "tagable_id"
    t.string "tagable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagable_id", "tagable_type"], name: "index_tags_on_tagable_id_and_tagable_type"
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "creation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.text "description"
    t.string "first_name"
    t.string "last_name"
    t.string "alias"
    t.string "address_formatted_address"
    t.string "address_street_number"
    t.string "address_street_name"
    t.string "address_street"
    t.string "address_city"
    t.string "address_zip_code"
    t.string "address_department"
    t.string "address_department_code"
    t.string "address_state"
    t.string "address_state_code"
    t.string "address_country"
    t.string "address_country_code"
    t.float "address_lat"
    t.float "address_lng"
    t.integer "age"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
