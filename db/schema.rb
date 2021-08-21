# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_24_201230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_flashes", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message", limit: 255
    t.datetime "expires"
  end

  create_table "courses", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", null: false
    t.string "slug"
    t.string "identifier_uuid", default: "", null: false
    t.integer "path_id"
    t.index ["identifier_uuid"], name: "index_courses_on_identifier_uuid", unique: true
    t.index ["path_id"], name: "index_courses_on_path_id"
    t.index ["slug"], name: "index_courses_on_slug"
  end

  create_table "flags", force: :cascade do |t|
    t.integer "flagger_id", null: false
    t.bigint "project_submission_id", null: false
    t.text "reason", default: "", null: false
    t.integer "status", default: 0, null: false
    t.integer "taken_action", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "resolved_by_id"
    t.index ["flagger_id"], name: "index_flags_on_flagger_id"
    t.index ["project_submission_id"], name: "index_flags_on_project_submission_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "lesson_completions", id: :serial, force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "lesson_identifier_uuid", default: "", null: false
    t.integer "course_id"
    t.integer "path_id"
    t.index ["course_id"], name: "index_lesson_completions_on_course_id"
    t.index ["lesson_id", "user_id"], name: "index_lesson_completions_on_lesson_id_and_user_id", unique: true
    t.index ["lesson_identifier_uuid"], name: "index_lesson_completions_on_lesson_identifier_uuid"
    t.index ["path_id"], name: "index_lesson_completions_on_path_id"
    t.index ["user_id"], name: "index_lesson_completions_on_user_id"
  end

  create_table "lessons", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.string "url", limit: 255
    t.integer "position", null: false
    t.text "description"
    t.boolean "is_project", default: false
    t.integer "section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.string "slug"
    t.boolean "accepts_submission", default: false, null: false
    t.boolean "has_live_preview", default: false, null: false
    t.boolean "choose_path_lesson", default: false, null: false
    t.string "identifier_uuid", default: "", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["identifier_uuid", "course_id"], name: "index_lessons_on_identifier_uuid_and_course_id", unique: true
    t.index ["position"], name: "index_lessons_on_position"
    t.index ["slug", "section_id"], name: "index_lessons_on_slug_and_section_id", unique: true
    t.index ["url"], name: "index_lessons_on_url"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url", null: false
    t.text "message", null: false
    t.string "title", null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "path_prerequisites", force: :cascade do |t|
    t.bigint "path_id", null: false
    t.bigint "prerequisite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["path_id", "prerequisite_id"], name: "index_path_prerequisites_on_path_id_and_prerequisite_id", unique: true
    t.index ["path_id"], name: "index_path_prerequisites_on_path_id"
    t.index ["prerequisite_id"], name: "index_path_prerequisites_on_prerequisite_id"
  end

  create_table "paths", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.boolean "default_path", default: false, null: false
    t.string "identifier_uuid", default: "", null: false
    t.index ["identifier_uuid"], name: "index_paths_on_identifier_uuid", unique: true
    t.index ["slug"], name: "index_paths_on_slug", unique: true
  end

  create_table "points", force: :cascade do |t|
    t.string "discord_id", null: false
    t.integer "points", default: 0, null: false
    t.index ["discord_id"], name: "index_points_on_discord_id", unique: true
  end

  create_table "project_submissions", id: :serial, force: :cascade do |t|
    t.string "repo_url"
    t.string "live_preview_url", default: "", null: false
    t.integer "user_id"
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_public", default: true, null: false
    t.boolean "banned", default: false, null: false
    t.integer "cached_votes_total", default: 0
    t.datetime "discarded_at"
    t.datetime "discard_at"
    t.index ["discarded_at"], name: "index_project_submissions_on_discarded_at"
    t.index ["is_public"], name: "index_project_submissions_on_is_public"
    t.index ["lesson_id"], name: "index_project_submissions_on_lesson_id"
    t.index ["user_id", "lesson_id"], name: "index_project_submissions_on_user_id_and_lesson_id", unique: true, where: "(discarded_at IS NULL)"
    t.index ["user_id"], name: "index_project_submissions_on_user_id"
  end

  create_table "sections", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.integer "position", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "identifier_uuid", default: "", null: false
    t.index ["course_id"], name: "index_sections_on_course_id"
    t.index ["identifier_uuid"], name: "index_sections_on_identifier_uuid", unique: true
    t.index ["position"], name: "index_sections_on_position"
  end

  create_table "success_stories", id: :serial, force: :cascade do |t|
    t.string "student_name"
    t.string "avatar_path_name"
    t.text "story_content"
    t.string "job_title"
    t.string "social_media_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_providers", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_providers_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", limit: 255
    t.text "learning_goal"
    t.string "confirmation_token", limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email", limit: 255
    t.boolean "admin", default: false, null: false
    t.string "avatar"
    t.integer "path_id", default: 1
    t.boolean "banned", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "flags", "project_submissions"
  add_foreign_key "flags", "users", column: "flagger_id"
  add_foreign_key "lesson_completions", "lessons", on_delete: :cascade
  add_foreign_key "lessons", "courses"
  add_foreign_key "path_prerequisites", "paths"
  add_foreign_key "path_prerequisites", "paths", column: "prerequisite_id"
  add_foreign_key "project_submissions", "lessons"
  add_foreign_key "project_submissions", "users"
end
