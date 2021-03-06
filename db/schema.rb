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

ActiveRecord::Schema.define(:version => 20130731035902) do

  create_table "accreditations", :force => true do |t|
    t.string   "individual_income"
    t.string   "joint_income"
    t.string   "net_worth"
    t.boolean  "experience"
    t.boolean  "agree"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "campaigns", :force => true do |t|
    t.string   "biz_name"
    t.text     "blurb"
    t.text     "about"
    t.text     "why_join"
    t.integer  "location_id"
    t.integer  "campaign_starter_id"
    t.integer  "host_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "successful"
    t.date     "expires"
  end

  create_table "charges", :force => true do |t|
    t.string   "full_name"
    t.string   "last4"
    t.integer  "user_id"
    t.string   "token"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.integer  "people_limit"
    t.text     "description"
    t.string   "menu_pdf"
    t.text     "menu_text"
    t.date     "date"
    t.float    "cost"
    t.integer  "length"
    t.text     "other_info"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "host_id"
    t.text     "blurb"
    t.time     "time"
  end

  create_table "follows", :force => true do |t|
    t.integer  "user_id"
    t.integer  "followable_id"
    t.string   "followable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "follows", ["followable_id", "followable_type"], :name => "index_follows_on_followable_id_and_followable_type"

  create_table "guests", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "ticket_id"
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "charge_id"
  end

  create_table "images", :force => true do |t|
    t.string   "image"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "title"
    t.text     "description"
    t.integer  "imageable_id"
    t.string   "imageable_type"
  end

  add_index "images", ["imageable_id", "imageable_type"], :name => "index_images_on_imageable_id_and_imageable_type"

  create_table "investments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "neighborhood"
    t.string   "location_title"
  end

  create_table "profiles", :force => true do |t|
    t.text     "blurb"
    t.integer  "location_id"
    t.text     "story"
    t.string   "home_zip"
    t.string   "work_zip"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "biz_name"
    t.string   "yelp_id"
    t.string   "neighborhood"
  end

  create_table "projects", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "logo"
    t.text     "location"
    t.text     "description"
    t.integer  "target"
    t.integer  "raised"
    t.text     "terms"
    t.integer  "min_investment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "business_plan"
    t.string   "category"
    t.boolean  "approved"
  end

  create_table "signups", :force => true do |t|
    t.string   "email"
    t.boolean  "chef"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "survey_answers", :force => true do |t|
    t.integer  "survey_question_id"
    t.text     "text"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "survey_questions", :force => true do |t|
    t.text     "question"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "topic"
    t.text     "low_extreme"
    t.text     "high_extreme"
    t.string   "format"
    t.boolean  "active"
    t.boolean  "for_chef"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "num_guests"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "total_paid"
    t.integer  "charge_id"
  end

  create_table "user_answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "survey_question_id"
    t.text     "text"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "approved",               :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "completed",              :default => false
    t.boolean  "chef"
    t.text     "points"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
