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

ActiveRecord::Schema.define(version: 20170110025801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_enum "climb_month", "january", "february", "march", "april", "may", "june", "july", "august", "september,october", "november", "december"
  create_enum "membership_status", "nonmember", "active", "lapsed"
  create_enum "registration_status", "appliedacceptedrejectedwaitlistleaderassistant"
  create_table "climb_classes", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

# Could not dump table "climb_registrations" because of following StandardError
#   Unknown type 'registration_status' for column 'registration_status'


  create_table "climb_schedules", force: :cascade do |t|
    t.string   "season"
    t.integer  "date"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

# Could not dump table "general_dates" because of following StandardError
#   Unknown type 'climb_month' for column 'climb_month'


  create_table "specific_dates", force: :cascade do |t|
    t.date     "date_leave_town"
    t.date     "date_leave_trailhead"
    t.date     "date_summit"
    t.date     "date_return_trailhead"
    t.date     "date_return_town"
    t.datetime "created_at",            :null=>false
    t.datetime "updated_at",            :null=>false
  end

  create_table "user_roles", force: :cascade do |t|
    t.string   "role"
    t.string   "description"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'membership_status' for column 'membership_status'


end
