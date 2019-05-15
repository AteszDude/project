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

ActiveRecord::Schema.define(version: 2019_05_13_195432) do

  create_table "blog_posts", force: :cascade do |t|
    t.text "body"
    t.time "postedat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "user1_id"
    t.integer "user2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "person1_id"
    t.integer "person2_id"
    t.datetime "time", null: false
    t.index ["person1_id"], name: "index_matches_on_person1_id"
    t.index ["person2_id"], name: "index_matches_on_person2_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "semimatches", force: :cascade do |t|
    t.integer "person1_id"
    t.integer "person2_id"
    t.datetime "time", null: false
    t.index ["person1_id"], name: "index_semimatches_on_person1_id"
    t.index ["person2_id"], name: "index_semimatches_on_person2_id"
  end

  create_table "unmatches", force: :cascade do |t|
    t.integer "person1_id"
    t.integer "person2_id"
    t.datetime "time", null: false
    t.index ["person1_id"], name: "index_unmatches_on_person1_id"
    t.index ["person2_id"], name: "index_unmatches_on_person2_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "registration"
    t.datetime "birth_date"
    t.integer "geoloc"
    t.text "description"
    t.integer "likes"
    t.integer "sex"
    t.integer "match_sex"
    t.integer "match_age_min"
    t.integer "match_age_max"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
