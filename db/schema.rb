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

ActiveRecord::Schema[7.1].define(version: 2023_11_30_102205) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.uuid "app_id"
    t.uuid "party_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_references", force: :cascade do |t|
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
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.string "area_code"
    t.string "ext"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cost_centers", force: :cascade do |t|
    t.uuid "app_id"
    t.string "cost_center_id"
    t.string "ctrl_name"
    t.text "desc"
    t.string "position"
    t.string "payroll_id"
    t.date "valid_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.uuid "app_id"
    t.string "code"
    t.string "name"
    t.string "symbol"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measurement_units", force: :cascade do |t|
    t.uuid "app_id"
    t.string "ident_name"
    t.string "name"
    t.string "symbol"
    t.text "desc"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.string "dimid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plants", force: :cascade do |t|
    t.uuid "app_id"
    t.uuid "facility_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.uuid "owner_party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prcmts", force: :cascade do |t|
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
    t.uuid "created_by_id"
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

  create_table "product_groups", force: :cascade do |t|
    t.uuid "app_id"
    t.uuid "party_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.uuid "app_id"
    t.string "product_type"
    t.uuid "product_group_id"
    t.string "code"
    t.string "name"
    t.uuid "measurement_unit_id"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_groups", force: :cascade do |t|
    t.uuid "app_id"
    t.uuid "purch_order_type_id"
    t.string "number"
    t.date "issued_date"
    t.string "name"
    t.uuid "incoterm_id"
    t.string "incoterm_desc"
    t.uuid "internal_org_id"
    t.uuid "purch_org_id"
    t.uuid "purch_group_id"
    t.uuid "prcmt_id"
    t.jsonb "data"
    t.string "state"
    t.uuid "vendor_id"
    t.string "referrable_type"
    t.uuid "referrable_id"
    t.uuid "payment_term_id"
    t.string "delivery_location"
    t.uuid "current_workflow_instance_id"
    t.boolean "used_up"
    t.datetime "finished_at", precision: nil
    t.datetime "discarded_at", precision: nil
    t.uuid "finished_by_id"
    t.integer "length_of_work"
    t.decimal "payment_term_number"
    t.string "payment_term_desc"
    t.string "po_type"
    t.boolean "contract"
    t.date "validity_start_date"
    t.date "commentcement_date"
    t.text "delivery_detail"
    t.text "remark"
    t.text "scope_of_work"
    t.decimal "po_to_amount"
    t.string "account_holder"
    t.string "account_number"
    t.string "po_signing"
    t.boolean "tax_policy"
    t.uuid "to_currency_id"
    t.date "rejected_at"
    t.uuid "cost_center_id"
    t.uuid "plant_id"
    t.string "uncommit_remark"
    t.boolean "is_replicated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_orgs", force: :cascade do |t|
    t.uuid "app_id"
    t.uuid "party_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_reqn_cancellations", force: :cascade do |t|
    t.bigint "app_id", null: false
    t.bigint "purch_reqn_id", null: false
    t.bigint "current_workflow_instance_id", null: false
    t.string "state"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_purch_reqn_cancellations_on_app_id"
    t.index ["created_by_id"], name: "index_purch_reqn_cancellations_on_created_by_id"
    t.index ["current_workflow_instance_id"], name: "index_purch_reqn_cancellations_on_current_workflow_instance_id"
    t.index ["purch_reqn_id"], name: "index_purch_reqn_cancellations_on_purch_reqn_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_cancellations_on_updated_by_id"
  end

  create_table "purch_reqn_item_buyers", force: :cascade do |t|
    t.bigint "app_id", null: false
    t.bigint "purch_reqn_item_id", null: false
    t.bigint "buyer_id", null: false
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_purch_reqn_item_buyers_on_app_id"
    t.index ["buyer_id"], name: "index_purch_reqn_item_buyers_on_buyer_id"
    t.index ["created_by_id"], name: "index_purch_reqn_item_buyers_on_created_by_id"
    t.index ["purch_reqn_item_id"], name: "index_purch_reqn_item_buyers_on_purch_reqn_item_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_item_buyers_on_updated_by_id"
  end

  create_table "purch_reqn_item_histories", force: :cascade do |t|
    t.bigint "app_id", null: false
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
    t.index ["app_id"], name: "index_purch_reqn_item_histories_on_app_id"
    t.index ["created_by_id"], name: "index_purch_reqn_item_histories_on_created_by_id"
    t.index ["purch_reqn_item_id"], name: "index_purch_reqn_item_histories_on_purch_reqn_item_id"
    t.index ["schedule_id"], name: "index_purch_reqn_item_histories_on_schedule_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_item_histories_on_updated_by_id"
  end

  create_table "purch_reqn_items", force: :cascade do |t|
    t.bigint "app_id", null: false
    t.bigint "purch_reqn_id", null: false
    t.string "number"
    t.bigint "product_group_id", null: false
    t.bigint "product_id", null: false
    t.string "desired_vendor"
    t.string "fixed_vendor"
    t.decimal "qty"
    t.bigint "measurement_unit_id", null: false
    t.decimal "est_unit_price"
    t.float "price_unit"
    t.decimal "est_subtotal"
    t.bigint "currency_id", null: false
    t.string "requisitioner"
    t.datetime "expected_delivery_date", precision: nil
    t.text "desc"
    t.jsonb "data"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.float "processed_qty"
    t.text "specification"
    t.text "note"
    t.datetime "deleted_at", precision: nil
    t.bigint "deleted_by_id", null: false
    t.string "item_type"
    t.bigint "wbsproject_id", null: false
    t.bigint "parent_id", null: false
    t.bigint "contract_item_reference_id", null: false
    t.boolean "contract_flag"
    t.bigint "purch_reqn_item_noncontract_id", null: false
    t.integer "commodity_list"
    t.decimal "adjustment_qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_purch_reqn_items_on_app_id"
    t.index ["contract_item_reference_id"], name: "index_purch_reqn_items_on_contract_item_reference_id"
    t.index ["created_by_id"], name: "index_purch_reqn_items_on_created_by_id"
    t.index ["currency_id"], name: "index_purch_reqn_items_on_currency_id"
    t.index ["deleted_by_id"], name: "index_purch_reqn_items_on_deleted_by_id"
    t.index ["measurement_unit_id"], name: "index_purch_reqn_items_on_measurement_unit_id"
    t.index ["parent_id"], name: "index_purch_reqn_items_on_parent_id"
    t.index ["product_group_id"], name: "index_purch_reqn_items_on_product_group_id"
    t.index ["product_id"], name: "index_purch_reqn_items_on_product_id"
    t.index ["purch_reqn_id"], name: "index_purch_reqn_items_on_purch_reqn_id"
    t.index ["purch_reqn_item_noncontract_id"], name: "index_purch_reqn_items_on_purch_reqn_item_noncontract_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_items_on_updated_by_id"
    t.index ["wbsproject_id"], name: "index_purch_reqn_items_on_wbsproject_id"
  end

  create_table "purch_reqn_link_types", force: :cascade do |t|
    t.bigint "app_id", null: false
    t.string "ident_name"
    t.string "name"
    t.text "desc"
    t.boolean "system"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_purch_reqn_link_types_on_app_id"
    t.index ["created_by_id"], name: "index_purch_reqn_link_types_on_created_by_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_link_types_on_updated_by_id"
  end

  create_table "purch_reqn_links", force: :cascade do |t|
    t.bigint "app_id", null: false
    t.bigint "purch_reqn_link_type_id", null: false
    t.bigint "from_purch_reqn_id", null: false
    t.bigint "to_purch_reqn_id", null: false
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_purch_reqn_links_on_app_id"
    t.index ["from_purch_reqn_id"], name: "index_purch_reqn_links_on_from_purch_reqn_id"
    t.index ["purch_reqn_link_type_id"], name: "index_purch_reqn_links_on_purch_reqn_link_type_id"
    t.index ["to_purch_reqn_id"], name: "index_purch_reqn_links_on_to_purch_reqn_id"
  end

  create_table "purch_reqn_partial_statuses", force: :cascade do |t|
    t.bigint "app_id", null: false
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
    t.index ["app_id"], name: "index_purch_reqn_partial_statuses_on_app_id"
    t.index ["created_by_id"], name: "index_purch_reqn_partial_statuses_on_created_by_id"
    t.index ["partial_itemable_id"], name: "index_purch_reqn_partial_statuses_on_partial_itemable_id"
    t.index ["partialable_id"], name: "index_purch_reqn_partial_statuses_on_partialable_id"
    t.index ["purch_reqn_partial_id"], name: "index_purch_reqn_partial_statuses_on_purch_reqn_partial_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_partial_statuses_on_updated_by_id"
  end

  create_table "purch_reqn_partials", force: :cascade do |t|
    t.bigint "app_id", null: false
    t.bigint "purch_reqn_item_id", null: false
    t.string "partialable_type"
    t.bigint "partialable_id", null: false
    t.string "partial_itemable_type"
    t.bigint "partial_itemable_id", null: false
    t.float "qty"
    t.jsonb "data"
    t.string "state"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_purch_reqn_partials_on_app_id"
    t.index ["created_by_id"], name: "index_purch_reqn_partials_on_created_by_id"
    t.index ["partial_itemable_id"], name: "index_purch_reqn_partials_on_partial_itemable_id"
    t.index ["partialable_id"], name: "index_purch_reqn_partials_on_partialable_id"
    t.index ["purch_reqn_item_id"], name: "index_purch_reqn_partials_on_purch_reqn_item_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_partials_on_updated_by_id"
  end

  create_table "purch_reqn_uncommits", force: :cascade do |t|
    t.bigint "app_id", null: false
    t.bigint "purch_reqn_id", null: false
    t.string "desc"
    t.text "uncommit_remark"
    t.string "state"
    t.bigint "current_workflow_instance_id", null: false
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_purch_reqn_uncommits_on_app_id"
    t.index ["created_by_id"], name: "index_purch_reqn_uncommits_on_created_by_id"
    t.index ["current_workflow_instance_id"], name: "index_purch_reqn_uncommits_on_current_workflow_instance_id"
    t.index ["purch_reqn_id"], name: "index_purch_reqn_uncommits_on_purch_reqn_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_uncommits_on_updated_by_id"
  end

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
