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

ActiveRecord::Schema.define(:version => 20120929101925) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "avatar"
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
    t.boolean  "can_publish",            :default => false
  end

  add_index "authors", ["email"], :name => "index_authors_on_email", :unique => true
  add_index "authors", ["reset_password_token"], :name => "index_authors_on_reset_password_token", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups", ["slug"], :name => "index_groups_on_slug", :unique => true

  create_table "phrases", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
    t.boolean  "published"
    t.integer  "group_id"
  end

  add_index "phrases", ["slug", "title", "description"], :name => "slug"
  add_index "phrases", ["slug"], :name => "index_phrases_on_slug", :unique => true
  add_index "phrases", ["title", "description"], :name => "title"

  create_table "revisions", :force => true do |t|
    t.integer  "phrase_id"
    t.string   "title"
    t.text     "description"
    t.integer  "author_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "revisions", ["title", "description"], :name => "title"

end
