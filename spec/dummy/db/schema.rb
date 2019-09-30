# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_03_110322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cm_page_builder_rails_page_components", force: :cascade do |t|
    t.string "uuid", null: false
    t.bigint "page_id", null: false
    t.string "content"
    t.integer "position"
    t.string "component_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["page_id"], name: "index_cm_page_builder_rails_page_components_on_page_id"
  end

  create_table "cm_page_builder_rails_pages", force: :cascade do |t|
    t.string "container_type", null: false
    t.bigint "container_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["container_type", "container_id"], name: "container_composite_index"
  end

  add_foreign_key "cm_page_builder_rails_page_components", "cm_page_builder_rails_pages", column: "page_id"
end
