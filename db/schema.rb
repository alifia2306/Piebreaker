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

ActiveRecord::Schema.define(:version => 20150418002922) do

  create_table "coupons", :force => true do |t|
    t.string   "username"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "owners", :force => true do |t|
    t.string   "username"
    t.string   "restaurant_name"
    t.string   "address"
    t.string   "password"
    t.string   "category"
    t.string   "plan"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "reviews", :force => true do |t|
    t.string   "review_id"
    t.integer  "stars"
    t.string   "date"
    t.string   "text"
    t.string   "business_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "business_id"
    t.string   "full_address"
    t.string   "categories"
    t.string   "city"
    t.integer  "review_count"
    t.string   "name"
    t.string   "state"
    t.integer  "price_range"
    t.boolean  "wifi"
    t.boolean  "parking"
    t.boolean  "delivery"
    t.boolean  "outdoor_seating"
    t.float    "rating"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
