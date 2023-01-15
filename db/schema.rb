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

ActiveRecord::Schema[7.0].define(version: 2022_10_04_053203) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "branches", force: :cascade do |t|
    t.string "name", limit: 30, default: "", null: false
    t.boolean "status", default: true
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_branches_on_company_id"
    t.index ["name"], name: "index_branches_on_name", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", limit: 100, default: "", null: false
    t.string "brand", limit: 60, default: "", null: false
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand"], name: "index_companies_on_brand", unique: true
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "costcenters", force: :cascade do |t|
    t.string "name", limit: 60, default: "", null: false
    t.boolean "status", default: true
    t.integer "branch_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_costcenters_on_branch_id"
    t.index ["name"], name: "index_costcenters_on_name", unique: true
    t.index ["service_id"], name: "index_costcenters_on_service_id"
  end

  create_table "destinies", force: :cascade do |t|
    t.string "name", limit: 60, default: "", null: false
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_destinies_on_name", unique: true
  end

  create_table "employee_costcenters", id: false, force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "costcenter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["costcenter_id"], name: "index_employee_costcenters_on_costcenter_id"
    t.index ["employee_id"], name: "index_employee_costcenters_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", limit: 100, default: "", null: false
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_employees_on_name", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", limit: 60, default: "", null: false
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_services_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_branches", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_users_branches_on_branch_id"
    t.index ["user_id", "branch_id"], name: "index_users_branches_on_user_id_and_branch_id"
    t.index ["user_id"], name: "index_users_branches_on_user_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "vehicle_costcenters", id: false, force: :cascade do |t|
    t.integer "vehicle_id", null: false
    t.integer "costcenter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["costcenter_id"], name: "index_vehicle_costcenters_on_costcenter_id"
    t.index ["vehicle_id"], name: "index_vehicle_costcenters_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "fleet"
    t.string "name", limit: 30, default: "", null: false
    t.string "brand", limit: 30, default: "", null: false
    t.string "plate", limit: 8, default: "", null: false
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_vehicles_on_name", unique: true
    t.index ["plate"], name: "index_vehicles_on_plate", unique: true
  end

  create_table "weighings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "branch_id", null: false
    t.integer "costcenter_id", null: false
    t.integer "destino", null: false
    t.integer "employee_id", null: false
    t.integer "vehicle_id", null: false
    t.date "dia", null: false
    t.time "hora", null: false
    t.decimal "weight_in", null: false
    t.decimal "weight_out", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "numbercupom"
    t.index ["branch_id"], name: "index_weighings_on_branch_id"
    t.index ["costcenter_id"], name: "index_weighings_on_costcenter_id"
    t.index ["employee_id"], name: "index_weighings_on_employee_id"
    t.index ["user_id"], name: "index_weighings_on_user_id"
    t.index ["vehicle_id"], name: "index_weighings_on_vehicle_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "branches", "companies"
  add_foreign_key "costcenters", "branches"
  add_foreign_key "costcenters", "services"
  add_foreign_key "employee_costcenters", "costcenters"
  add_foreign_key "employee_costcenters", "employees"
  add_foreign_key "vehicle_costcenters", "costcenters"
  add_foreign_key "vehicle_costcenters", "vehicles"
  add_foreign_key "weighings", "branches"
  add_foreign_key "weighings", "costcenters"
  add_foreign_key "weighings", "employees"
  add_foreign_key "weighings", "users"
  add_foreign_key "weighings", "vehicles"
end
