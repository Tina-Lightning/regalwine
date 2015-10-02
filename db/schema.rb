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

ActiveRecord::Schema.define(version: 20151002142726) do

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "viticulture"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.string   "image"
    t.string   "website"
    t.string   "country"
    t.string   "region"
    t.string   "appellation"
    t.string   "varietal"
    t.string   "soil_type"
    t.string   "enologist"
    t.string   "viticulturist"
    t.string   "vineyard_size"
    t.string   "total_production"
  end

  add_index "brands", ["user_id"], name: "index_brands_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "product_type"
    t.string   "product_subtype"
    t.string   "vintage"
    t.string   "country"
    t.string   "region"
    t.integer  "brand_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.string   "image"
    t.string   "appellation"
    t.string   "vineyard"
    t.string   "grape_varietals"
    t.string   "clones"
    t.text     "soil"
    t.text     "plot_characteristics"
    t.string   "yield"
    t.string   "vineyard_practices"
    t.string   "harvest"
    t.string   "yeast"
    t.text     "accolades"
    t.string   "producer"
    t.string   "bottle_size"
    t.string   "style"
    t.text     "vinification_methods"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id"
  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
