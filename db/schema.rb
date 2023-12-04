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

ActiveRecord::Schema[7.1].define(version: 2023_12_04_124713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "party_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_references", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "app_id"
    t.uuid "contact_type_id"
    t.string "number"
    t.uuid "country_id"
    t.string "other_country"
    t.uuid "province_id"
    t.string "other_province"
    t.uuid "district_id"
    t.string "other_district"
    t.uuid "sub_district_id"
    t.string "other_sub_district"
    t.uuid "village_id"
    t.string "other_village"
    t.text "postal_address"
    t.string "electronic_address"
    t.uuid "created_by"
    t.uuid "updated_by_id"
    t.string "area_code"
    t.string "ext"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cost_centers", force: :cascade do |t|
    t.string "cost_center_id"
    t.string "ctrl_name"
    t.text "desc"
    t.string "position"
    t.string "payroll_id"
    t.date "valid_to"
    t.uuid "created_by"
    t.uuid "updated_by"
    t.uuid "purch_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "app_id"
    t.string "code"
    t.string "name"
    t.string "symbol"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "facility_type"
    t.string "name"
    t.uuid "created_by"
    t.uuid "updated_by"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_facilities_on_discarded_at"
    t.index ["facility_type"], name: "index_facilities_on_facility_type"
  end

  create_table "measurement_units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "app_id"
    t.string "ident_name"
    t.string "name"
    t.string "symbol"
    t.text "desc"
    t.uuid "created_by"
    t.uuid "updated_by_id"
    t.string "dimid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string "party_type"
    t.string "full_name"
    t.jsonb "data"
    t.uuid "created_by"
    t.uuid "updated_by"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_parties_on_discarded_at"
    t.index ["party_type"], name: "index_parties_on_party_type"
  end

  create_table "plants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "facility_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.uuid "owner_party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prcmts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "app_id"
    t.uuid "prcmt_type_id"
    t.string "number"
    t.string "name"
    t.text "scope_of_work"
    t.uuid "purch_org_id"
    t.uuid "purch_group_id"
    t.uuid "buyer_id"
    t.string "prebid_meeting"
    t.boolean "prequalification"
    t.boolean "auction"
    t.string "bid_submission_method"
    t.string "quotation_media"
    t.integer "quotation_validity_days"
    t.string "eval_method"
    t.uuid "incoterm_id"
    t.string "proposed_delivery_location"
    t.string "purch_order_number"
    t.string "contract_number"
    t.jsonb "data"
    t.uuid "current_workflow_instance_id"
    t.string "state"
    t.uuid "created_by"
    t.uuid "updated_by_id"
    t.boolean "bid_bond"
    t.jsonb "scope_of_supplies"
    t.datetime "announced_at", precision: nil
    t.datetime "cancelled_at", precision: nil
    t.datetime "finished_at", precision: nil
    t.text "desc"
    t.text "internal_remark"
    t.text "candidate_selection_remark"
    t.text "finish_remark"
    t.string "prcmt_phase_evaluation_visibility"
    t.text "cancel_remark"
    t.string "aanwijzing_visibility"
    t.string "bid_bond_visibility"
    t.decimal "est_total"
    t.uuid "prcmt_criterion_template_id"
    t.uuid "internal_org_id"
    t.uuid "plant_id"
    t.string "assessment_method"
    t.json "business_class"
    t.string "business_field"
    t.decimal "tkdn_percentage"
    t.string "tender_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "app_id"
    t.uuid "party_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "app_id"
    t.string "product_type"
    t.uuid "product_group_id"
    t.string "code"
    t.string "name"
    t.uuid "measurement_unit_id"
    t.uuid "created_by"
    t.uuid "updated_by_id"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "party_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.string "description"
    t.uuid "created_by"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_orgs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "party_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_reqn_cancellations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn", null: false
    t.uuid "current_workflow_instance", null: false
    t.string "state"
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_reqn_item_buyers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_item", null: false
    t.uuid "buyer", null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_reqn_item_histories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "purch_reqn_item_id", null: false
    t.string "desc"
    t.string "username"
    t.boolean "system"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "finished_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_item_histories_on_created_by_id"
    t.index ["purch_reqn_item_id"], name: "index_purch_reqn_item_histories_on_purch_reqn_item_id"
    t.index ["schedule_id"], name: "index_purch_reqn_item_histories_on_schedule_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_item_histories_on_updated_by_id"
  end

  create_table "purch_reqn_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn", null: false
    t.string "number"
    t.uuid "product_group", null: false
    t.uuid "product", null: false
    t.string "desired_vendor"
    t.string "fixed_vendor"
    t.decimal "qty"
    t.uuid "measurement_unit", null: false
    t.decimal "est_unit_price"
    t.float "price_unit"
    t.decimal "est_subtotal"
    t.uuid "currency", null: false
    t.string "requisitioner"
    t.datetime "expected_delivery_date", precision: nil
    t.text "desc"
    t.jsonb "data"
    t.float "processed_qty"
    t.text "specification"
    t.text "note"
    t.datetime "deleted_at", precision: nil
    t.uuid "deleted_by", null: false
    t.string "item_type"
    t.uuid "wbsproject", null: false
    t.uuid "parent", null: false
    t.uuid "contract_item_reference", null: false
    t.boolean "contract_flag"
    t.uuid "purch_reqn_item_noncontract", null: false
    t.integer "commodity_list"
    t.decimal "adjustment_qty"
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_purch_reqn_items_on_discarded_at"
    t.index ["purch_reqn"], name: "index_purch_reqn_items_on_purch_reqn"
  end

  create_table "purch_reqn_link_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "ident_name"
    t.string "name"
    t.text "desc"
    t.boolean "system"
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_reqn_links", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_link_type", null: false
    t.uuid "from_purch_reqn", null: false
    t.uuid "to_purch_reqn", null: false
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_reqn_partial_statuses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "purch_reqn_partial_id", null: false
    t.string "partialable_type"
    t.bigint "partialable_id", null: false
    t.string "partial_itemable_type"
    t.bigint "partial_itemable_id", null: false
    t.string "status"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_partial_statuses_on_created_by_id"
    t.index ["partial_itemable_id"], name: "index_purch_reqn_partial_statuses_on_partial_itemable_id"
    t.index ["partialable_id"], name: "index_purch_reqn_partial_statuses_on_partialable_id"
    t.index ["purch_reqn_partial_id"], name: "index_purch_reqn_partial_statuses_on_purch_reqn_partial_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_partial_statuses_on_updated_by_id"
  end

  create_table "purch_reqn_partials", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_item", null: false
    t.string "partialable_type"
    t.uuid "partialable", null: false
    t.string "partial_itemable_type"
    t.uuid "partial_itemable", null: false
    t.float "qty"
    t.jsonb "data"
    t.string "state"
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_purch_reqn_partials_on_discarded_at"
    t.index ["purch_reqn_item"], name: "index_purch_reqn_partials_on_purch_reqn_item"
  end

  create_table "purch_reqn_uncommits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn", null: false
    t.string "desc"
    t.text "uncommit_remark"
    t.string "state"
    t.uuid "current_workflow_instance", null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_purch_reqn_uncommits_on_discarded_at"
    t.index ["purch_reqn"], name: "index_purch_reqn_uncommits_on_purch_reqn"
  end

  create_table "purch_reqns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "number"
    t.text "desc"
    t.string "state"
    t.uuid "purch_org"
    t.string "purch_reqn_type"
    t.boolean "contract"
    t.uuid "purch_group"
    t.uuid "plant"
    t.uuid "cost_center"
    t.string "fund_source"
    t.uuid "currency"
    t.uuid "recreate_from"
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
    t.uuid "contract_reference"
    t.uuid "prcmt"
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cost_center"], name: "index_purch_reqns_on_cost_center"
    t.index ["created_by"], name: "index_purch_reqns_on_created_by"
    t.index ["currency"], name: "index_purch_reqns_on_currency"
    t.index ["discarded_at"], name: "index_purch_reqns_on_discarded_at"
    t.index ["number"], name: "index_purch_reqns_on_number", unique: true
    t.index ["plant"], name: "index_purch_reqns_on_plant"
    t.index ["purch_group"], name: "index_purch_reqns_on_purch_group"
    t.index ["purch_org"], name: "index_purch_reqns_on_purch_org"
    t.index ["updated_by"], name: "index_purch_reqns_on_updated_by"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
