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

ActiveRecord::Schema.define(version: 2021_12_19_225709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.integer "department_id"
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "login_error_count"
    t.datetime "lock_datetime_to"
    t.index ["name"], name: "index_admin_users_on_name", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "department_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_code"], name: "index_departments_on_department_code", unique: true
  end

  create_table "meeting_room_reservations", force: :cascade do |t|
    t.integer "meeting_room_id", null: false
    t.integer "reserve_user_id", null: false
    t.integer "number_of_people", null: false
    t.string "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_reserve_date_time", null: false
    t.datetime "end_reserve_date_time", null: false
  end

  create_table "meeting_rooms", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "department_id", null: false
    t.string "name"
    t.string "password"
    t.string "email"
    t.date "lock_end_date"
    t.integer "login_error_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
