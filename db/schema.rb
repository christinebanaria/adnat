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

ActiveRecord::Schema.define(version: 20190409015416) do

  create_table "organisations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 50, null: false
    t.float "hourly_rate", limit: 24, null: false
  end

  create_table "shifts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.datetime "start"
    t.datetime "finish"
    t.integer "break_length"
    t.index ["user_id"], name: "fkShiftsUsers"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "organisation_id"
    t.string "name", limit: 50, null: false
    t.string "email_address", limit: 100, null: false
    t.string "password_digest", limit: 100
    t.index ["organisation_id"], name: "fkUsersOrganisation"
  end

  add_foreign_key "shifts", "users", name: "fkShiftsUsers"
  add_foreign_key "users", "organisations", name: "fkUsersOrganisation"
end
