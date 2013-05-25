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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130525002607) do

  create_table "cal_events", :force => true do |t|
    t.string   "summary"
    t.datetime "start"
    t.datetime "end"
    t.text     "description"
    t.string   "time_zone"
    t.integer  "creator_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "cal_events", ["creator_id"], :name => "index_cal_events_on_creator_id"
  add_index "cal_events", ["end"], :name => "index_cal_events_on_end"
  add_index "cal_events", ["start"], :name => "index_cal_events_on_start"

  create_table "splash_emails", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "splash_emails", ["email"], :name => "index_splash_emails_on_email", :unique => true

end
