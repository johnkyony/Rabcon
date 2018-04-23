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

ActiveRecord::Schema.define(version: 20180416221000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clock_ins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_leader_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "time_clocked_in"
  end

  add_index "clock_ins", ["team_leader_id"], name: "index_clock_ins_on_team_leader_id", using: :btree
  add_index "clock_ins", ["user_id"], name: "index_clock_ins_on_user_id", using: :btree

  create_table "clock_outs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_leader_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "time_clocked_out"
  end

  add_index "clock_outs", ["team_leader_id"], name: "index_clock_outs_on_team_leader_id", using: :btree
  add_index "clock_outs", ["user_id"], name: "index_clock_outs_on_user_id", using: :btree

  create_table "daily_payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "clock_in_id"
    t.integer  "clock_out_id"
    t.float    "amount"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.float    "regular_hours"
    t.float    "overtime_hours"
    t.date     "date_of_working_day"
  end

  add_index "daily_payments", ["clock_in_id"], name: "index_daily_payments_on_clock_in_id", using: :btree
  add_index "daily_payments", ["clock_out_id"], name: "index_daily_payments_on_clock_out_id", using: :btree
  add_index "daily_payments", ["user_id"], name: "index_daily_payments_on_user_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "full_name"
    t.string   "address"
    t.datetime "birthdate"
    t.string   "id_or_passport_number"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "payments", force: :cascade do |t|
    t.float    "total_overtime_earning_for_work_week"
    t.float    "wages_amount"
    t.date     "date_of_payment"
    t.date     "pay_period"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "payroll_details", force: :cascade do |t|
    t.string   "employees_work_week_start"
    t.integer  "work_week_hours"
    t.integer  "basis_wages_paid"
    t.float    "regular_hourly_payrate"
    t.integer  "daily_or_weekly_straight_time"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "payroll_details", ["user_id"], name: "index_payroll_details_on_user_id", using: :btree

  create_table "payrolls", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "employees_work_week_start"
    t.integer  "work_week_hours"
    t.float    "regular_hourly_payrate"
    t.integer  "daily_or_weekly_straight_time"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "payrolls", ["employee_id"], name: "index_payrolls_on_employee_id", using: :btree

  create_table "staff_details", force: :cascade do |t|
    t.string   "employee_full_name"
    t.string   "address"
    t.datetime "birthdate"
    t.string   "id_or_passport_number"
    t.string   "employee_number"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "staff_details", ["user_id"], name: "index_staff_details_on_user_id", using: :btree

  create_table "taxes", force: :cascade do |t|
    t.string   "name"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_leaders", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "team_member_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "team_leaders", ["team_id"], name: "index_team_leaders_on_team_id", using: :btree
  add_index "team_leaders", ["team_member_id"], name: "index_team_leaders_on_team_member_id", using: :btree

  create_table "team_members", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "team_members", ["employee_id"], name: "index_team_members_on_employee_id", using: :btree
  add_index "team_members", ["team_id"], name: "index_team_members_on_team_id", using: :btree
  add_index "team_members", ["user_id"], name: "index_team_members_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "description"
  end

  add_index "teams", ["department_id"], name: "index_teams_on_department_id", using: :btree

  create_table "timesheets", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "team_leader_id"
    t.time     "clock_in_at"
    t.time     "clock_out_at"
    t.date     "punch_in_on"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "timesheets", ["employee_id"], name: "index_timesheets_on_employee_id", using: :btree
  add_index "timesheets", ["team_leader_id"], name: "index_timesheets_on_team_leader_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "payrolls", "employees"
  add_foreign_key "team_members", "employees"
  add_foreign_key "timesheets", "employees"
  add_foreign_key "timesheets", "team_leaders"
end
