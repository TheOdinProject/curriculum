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

ActiveRecord::Schema.define(version: 20161224052711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_flashes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "message"
    t.datetime "expires"
  end

  create_table "ads", force: :cascade do |t|
    t.string   "image_path",                null: false
    t.string   "url",                       null: false
    t.string   "style",                     null: false
    t.string   "client",                    null: false
    t.string   "category",                  null: false
    t.integer  "display_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title_url"
    t.integer  "position",                    null: false
    t.string   "you_learn"
    t.string   "you_build"
    t.string   "teaser"
    t.text     "brief_desc"
    t.boolean  "is_active",   default: false
    t.string   "slug"
    t.index ["slug"], name: "index_courses_on_slug", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "lesson_completions", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["lesson_id", "student_id"], name: "index_lesson_completions_on_lesson_id_and_student_id", unique: true, using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "position",                    null: false
    t.text     "description"
    t.boolean  "is_project",  default: false
    t.integer  "section_id",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title_url"
    t.text     "content"
    t.string   "slug"
    t.index ["position"], name: "index_lessons_on_position", unique: true, using: :btree
    t.index ["slug", "section_id"], name: "index_lessons_on_slug_and_section_id", unique: true, using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "repo_url"
    t.string   "live_preview"
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["lesson_id"], name: "index_projects_on_lesson_id", using: :btree
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "sections", force: :cascade do |t|
    t.string   "title"
    t.integer  "position",    null: false
    t.integer  "course_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title_url"
    t.text     "description"
    t.index ["course_id"], name: "index_sections_on_course_id", using: :btree
    t.index ["position"], name: "index_sections_on_position", using: :btree
    t.index ["title_url"], name: "index_sections_on_title_url", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.text     "about"
    t.string   "github"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "google_plus"
    t.string   "skype"
    t.string   "screenhero"
    t.boolean  "legal_agreement",        default: false, null: false
    t.datetime "legal_agree_date"
    t.string   "provider"
    t.string   "uid"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["legal_agreement"], name: "index_users_on_legal_agreement", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "projects", "lessons"
  add_foreign_key "projects", "users"
end
