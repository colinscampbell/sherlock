# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150218062505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.integer  "play_id",     null: false
    t.integer  "location_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "actions", ["location_id"], name: "index_actions_on_location_id", using: :btree
  add_index "actions", ["play_id"], name: "index_actions_on_play_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.text     "text",                    null: false
    t.integer  "points",      default: 0, null: false
    t.integer  "question_id",             null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "answers", ["question_id", "text"], name: "index_answers_on_question_id_and_text", unique: true, using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "text"
    t.integer  "scenario_id", null: false
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "contacts", ["scenario_id", "location_id"], name: "index_contacts_on_scenario_id_and_location_id", unique: true, using: :btree

  create_table "guesses", force: :cascade do |t|
    t.text     "text"
    t.integer  "play_id",     null: false
    t.integer  "question_id", null: false
    t.integer  "answer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "guesses", ["play_id"], name: "index_guesses_on_play_id", using: :btree
  add_index "guesses", ["question_id"], name: "index_guesses_on_question_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "address",     null: false
    t.string   "name",        null: false
    t.integer  "universe_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["universe_id", "address"], name: "index_locations_on_universe_id_and_address", unique: true, using: :btree

  create_table "plays", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "scenario_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "plays", ["scenario_id"], name: "index_plays_on_scenario_id", using: :btree
  add_index "plays", ["user_id"], name: "index_plays_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "text",                            null: false
    t.boolean  "multiple_choice", default: false, null: false
    t.integer  "scenario_id",                     null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "questions", ["scenario_id"], name: "index_questions_on_scenario_id", using: :btree

  create_table "scenarios", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.text     "solution"
    t.integer  "universe_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "scenarios", ["universe_id", "name"], name: "index_scenarios_on_universe_id_and_name", unique: true, using: :btree
  add_index "scenarios", ["user_id"], name: "index_scenarios_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "token",      null: false
    t.string   "ip_address", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", unique: true, using: :btree
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "universes", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "universes", ["name"], name: "index_universes_on_name", unique: true, using: :btree
  add_index "universes", ["user_id"], name: "index_universes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",      null: false
    t.string   "email",      null: false
    t.string   "fname"
    t.string   "lname"
    t.string   "password",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

end
