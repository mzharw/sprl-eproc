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

ActiveRecord::Schema[7.1].define(version: 2023_11_29_142230) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "purch_reqns", force: :cascade do |t|
    t.string "number"
    t.text "desc"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.string "state"
    t.bigint "purch_org_id", null: false
    t.string "purch_reqn_type"
    t.boolean "contract"
    t.bigint "purch_group_id", null: false
    t.bigint "plant_id", null: false
    t.bigint "cost_center_id", null: false
    t.string "fund_source"
    t.bigint "currency_id", null: false
    t.bigint "recreate_from_id", null: false
    t.string "contract_title"
    t.string "scope_of_work"
    t.string "justification"
    t.string "budget_soure"
    t.string "reason"
    t.string "contract_type"
    t.string "risk_category"
    t.string "explanation"
    t.string "previous_contract_number"
    t.string "previous_contract_title"
    t.decimal "local_of_content"
    t.datetime "rejected_at", precision: nil
    t.text "cancel_remark"
    t.bigint "contract_reference_id", null: false
    t.bigint "prcmt_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_reference_id"], name: "index_purch_reqns_on_contract_reference_id"
    t.index ["cost_center_id"], name: "index_purch_reqns_on_cost_center_id"
    t.index ["created_by_id"], name: "index_purch_reqns_on_created_by_id"
    t.index ["currency_id"], name: "index_purch_reqns_on_currency_id"
    t.index ["plant_id"], name: "index_purch_reqns_on_plant_id"
    t.index ["prcmt_id"], name: "index_purch_reqns_on_prcmt_id"
    t.index ["purch_group_id"], name: "index_purch_reqns_on_purch_group_id"
    t.index ["purch_org_id"], name: "index_purch_reqns_on_purch_org_id"
    t.index ["recreate_from_id"], name: "index_purch_reqns_on_recreate_from_id"
    t.index ["updated_by_id"], name: "index_purch_reqns_on_updated_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
