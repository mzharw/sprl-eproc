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

ActiveRecord::Schema[7.1].define(version: 2024_03_07_083846) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "buyer_plants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "buyer_id"
    t.uuid "plant_id"
    t.date "from_date"
    t.date "thru_date"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buyer_purch_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "buyer_id"
    t.uuid "purch_group_id"
    t.date "from_date"
    t.date "thru_date"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buyers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "party_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", default: "INACTIVE"
    t.index ["created_by_id"], name: "index_buyers_on_created_by_id"
    t.index ["updated_by_id"], name: "index_buyers_on_updated_by_id"
  end

  create_table "commodity_lists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "commodity_list_id"
    t.string "number"
    t.string "description"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_references", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.index ["created_by_id"], name: "index_contract_references_on_created_by_id"
    t.index ["updated_by_id"], name: "index_contract_references_on_updated_by_id"
  end

  create_table "cost_centers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "cost_center_id"
    t.string "ctrl_name"
    t.string "desc"
    t.string "position"
    t.string "payroll_id"
    t.date "valid_to"
    t.uuid "purch_group_id"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_cost_centers_on_created_by_id"
    t.index ["updated_by_id"], name: "index_cost_centers_on_updated_by_id"
  end

  create_table "currencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "symbol"
    t.text "desc"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["created_by_id"], name: "index_currencies_on_created_by_id"
    t.index ["updated_by_id"], name: "index_currencies_on_updated_by_id"
  end

  create_table "currency_exchange_rates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "from_currency_id"
    t.decimal "from_amount"
    t.uuid "to_currency_id"
    t.decimal "to_amount"
    t.datetime "from_time", precision: nil
    t.datetime "thru_time", precision: nil
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.string "issuer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "facility_type"
    t.string "name"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "discarded_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_facilities_on_created_by_id"
    t.index ["discarded_at"], name: "index_facilities_on_discarded_at"
    t.index ["facility_type"], name: "index_facilities_on_facility_type"
    t.index ["updated_by_id"], name: "index_facilities_on_updated_by_id"
  end

  create_table "measurement_units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "ident_name"
    t.string "name"
    t.string "symbol"
    t.text "desc"
    t.string "dimid"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["created_by_id"], name: "index_measurement_units_on_created_by_id"
    t.index ["updated_by_id"], name: "index_measurement_units_on_updated_by_id"
  end

  create_table "parties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "party_type"
    t.string "full_name"
    t.jsonb "data"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "discarded_at", precision: nil
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["created_by_id"], name: "index_parties_on_created_by_id"
    t.index ["discarded_at"], name: "index_parties_on_discarded_at"
    t.index ["party_type"], name: "index_parties_on_party_type"
    t.index ["updated_by_id"], name: "index_parties_on_updated_by_id"
  end

  create_table "personnels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "party_id"
    t.date "from_date"
    t.date "thru_date"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.string "position_name"
    t.uuid "unit_internal_org_id"
    t.string "number"
    t.boolean "is_section_head"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "facility_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.uuid "owner_party_id"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sap"
    t.index ["created_by_id"], name: "index_plants_on_created_by_id"
    t.index ["updated_by_id"], name: "index_plants_on_updated_by_id"
  end

  create_table "prcmt_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "prcmt_id"
    t.string "number"
    t.uuid "purch_reqn_item_id"
    t.uuid "product_group_id"
    t.uuid "product_id"
    t.string "desired_vendor"
    t.string "fixed_vendor"
    t.float "qty"
    t.uuid "measurement_unit_id"
    t.decimal "est_unit_price"
    t.float "price_unit"
    t.decimal "est_subtotal"
    t.uuid "currency_id"
    t.uuid "purch_group_id"
    t.string "requisitioner"
    t.datetime "expected_delivery_date", precision: nil
    t.text "desc"
    t.json "data"
    t.text "specification"
    t.text "note"
    t.uuid "prcmt_award_item_id"
    t.string "state"
    t.datetime "awarded_at", precision: nil
    t.boolean "po_processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prcmt_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "ident_name"
    t.string "name"
    t.text "desc"
    t.boolean "system"
    t.string "visibility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
  end

  create_table "prcmts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.string "state", default: "DRAFT"
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
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_prcmts_on_created_by_id"
    t.index ["updated_by_id"], name: "index_prcmts_on_updated_by_id"
  end

  create_table "product_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "desc"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "product_type"
    t.uuid "product_group_id"
    t.string "code"
    t.string "name"
    t.uuid "measurement_unit_id"
    t.text "desc"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_products_on_created_by_id"
    t.index ["updated_by_id"], name: "index_products_on_updated_by_id"
  end

  create_table "purch_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "party_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.string "description"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["created_by_id"], name: "index_purch_groups_on_created_by_id"
    t.index ["updated_by_id"], name: "index_purch_groups_on_updated_by_id"
  end

  create_table "purch_order_item_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "parent_id"
    t.string "ident_name"
    t.string "name"
    t.text "desc"
    t.string "sign"
    t.integer "seq"
    t.boolean "children_allowed"
    t.boolean "sales_taxable"
    t.boolean "system"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_order_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_order_id"
    t.string "number"
    t.uuid "purch_reqn_item_id"
    t.uuid "prcmt_item_id"
    t.uuid "product_group_id"
    t.uuid "product_id"
    t.float "qty"
    t.uuid "measurement_unit_id"
    t.decimal "unit_price"
    t.float "price_unit"
    t.decimal "subtotal"
    t.text "desc"
    t.text "specification"
    t.text "note"
    t.jsonb "data"
    t.uuid "created_by"
    t.uuid "updated_by"
    t.date "delivery_date"
    t.uuid "from_currency"
    t.decimal "from_amount"
    t.uuid "to_currency"
    t.decimal "to_amount"
    t.uuid "purch_order_item_type"
    t.decimal "line_total"
    t.boolean "sales_taxable"
    t.string "ancestry"
    t.integer "ancestry_depth"
    t.string "amount_type"
    t.integer "seq"
    t.float "process_qty"
    t.string "item_type"
    t.uuid "parent_id"
    t.uuid "wbsproject_id"
    t.uuid "cost_center_id"
    t.decimal "process_unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purch_order_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "ident_name"
    t.string "name"
    t.text "desc"
    t.boolean "system"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
  end

  create_table "purch_orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.string "state", default: "DRAFT"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
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
    t.float "payment_term_number"
    t.string "payment_term_desc"
    t.string "po_type"
    t.boolean "contract"
    t.date "validity_start_date"
    t.date "commentcement_date"
    t.text "delivery_detail"
    t.text "remark"
    t.text "scope_of_work"
    t.float "po_to_amount"
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
    t.datetime "fully_approved_at", precision: nil
    t.uuid "purch_reqn_id"
  end

  create_table "purch_orgs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "party_id"
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_orgs_on_created_by_id"
    t.index ["updated_by_id"], name: "index_purch_orgs_on_updated_by_id"
  end

  create_table "purch_reqn_cancellations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_id"
    t.uuid "current_workflow_instance"
    t.string "state", default: "ACTIVE"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_cancellations_on_created_by_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_cancellations_on_updated_by_id"
  end

  create_table "purch_reqn_item_buyers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_item_id", null: false
    t.uuid "buyer_id", null: false
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_item_buyers_on_created_by_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_item_buyers_on_updated_by_id"
  end

  create_table "purch_reqn_item_histories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_item_id", null: false
    t.string "desc"
    t.string "username"
    t.boolean "system"
    t.uuid "schedule", null: false
    t.datetime "finished_at", precision: nil
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_item_histories_on_created_by_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_item_histories_on_updated_by_id"
  end

  create_table "purch_reqn_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_id"
    t.string "number"
    t.uuid "product_group_id"
    t.uuid "product_id"
    t.string "desired_vendor"
    t.string "fixed_vendor"
    t.decimal "qty"
    t.uuid "measurement_unit_id"
    t.decimal "est_unit_price", default: "0.0"
    t.float "price_unit", default: 0.0
    t.decimal "est_subtotal", default: "0.0"
    t.uuid "currency_id"
    t.string "requisitioner"
    t.datetime "expected_delivery_date", precision: nil
    t.text "desc"
    t.json "data"
    t.float "processed_qty"
    t.text "specification"
    t.text "note"
    t.string "item_type"
    t.uuid "wbsproject_id"
    t.uuid "parent_id"
    t.uuid "contract_item_reference_id"
    t.boolean "contract_flag"
    t.uuid "purch_reqn_item_noncontract_id"
    t.uuid "commodity_list_id"
    t.decimal "adjustment_qty"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.uuid "discarded_by_id"
    t.datetime "discarded_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_items_on_created_by_id"
    t.index ["discarded_at"], name: "index_purch_reqn_items_on_discarded_at"
    t.index ["purch_reqn_id"], name: "index_purch_reqn_items_on_purch_reqn_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_items_on_updated_by_id"
  end

  create_table "purch_reqn_link_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "ident_name"
    t.string "name"
    t.text "desc"
    t.boolean "system"
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_link_types_on_created_by_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_link_types_on_updated_by_id"
  end

  create_table "purch_reqn_links", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_link_type_id", null: false
    t.uuid "from_purch_reqn_id", null: false
    t.uuid "to_purch_reqn_id", null: false
    t.string "desc"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_links_on_created_by_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_links_on_updated_by_id"
  end

  create_table "purch_reqn_partial_statuses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_partial_id", null: false
    t.string "partialable_type"
    t.uuid "partialable_id", null: false
    t.string "partial_itemable_type"
    t.uuid "partial_itemable_id", null: false
    t.string "status"
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_partial_statuses_on_created_by_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_partial_statuses_on_updated_by_id"
  end

  create_table "purch_reqn_partials", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_item_id", null: false
    t.string "partialable_type"
    t.uuid "partialable", null: false
    t.string "partial_itemable_type"
    t.uuid "partial_itemable", null: false
    t.float "qty"
    t.jsonb "data"
    t.string "state", default: "ACTIVE"
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "discarded_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_partials_on_created_by_id"
    t.index ["discarded_at"], name: "index_purch_reqn_partials_on_discarded_at"
    t.index ["purch_reqn_item_id"], name: "index_purch_reqn_partials_on_purch_reqn_item_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_partials_on_updated_by_id"
  end

  create_table "purch_reqn_uncommits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purch_reqn_id", null: false
    t.string "desc"
    t.text "uncommit_remark"
    t.string "state", default: "ACTIVE"
    t.uuid "current_workflow_instance", null: false
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "discarded_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_purch_reqn_uncommits_on_created_by_id"
    t.index ["discarded_at"], name: "index_purch_reqn_uncommits_on_discarded_at"
    t.index ["purch_reqn_id"], name: "index_purch_reqn_uncommits_on_purch_reqn_id"
    t.index ["updated_by_id"], name: "index_purch_reqn_uncommits_on_updated_by_id"
  end

  create_table "purch_reqns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "number"
    t.text "desc"
    t.string "state", default: "ACTIVE"
    t.uuid "purch_org_id"
    t.string "purch_reqn_type"
    t.boolean "contract"
    t.uuid "purch_group_id"
    t.uuid "plant_id"
    t.uuid "cost_center_id"
    t.string "fund_source"
    t.uuid "currency_id"
    t.uuid "prior_to_id"
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
    t.uuid "contract_reference_id"
    t.uuid "prcmt_id"
    t.uuid "current_workflow_instance_id"
    t.uuid "created_by_id", null: false
    t.uuid "updated_by_id", null: false
    t.datetime "discarded_at", precision: nil
    t.uuid "discarded_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cost_center_id"], name: "index_purch_reqns_on_cost_center_id"
    t.index ["created_by_id"], name: "index_purch_reqns_on_created_by_id"
    t.index ["currency_id"], name: "index_purch_reqns_on_currency_id"
    t.index ["discarded_at"], name: "index_purch_reqns_on_discarded_at"
    t.index ["number"], name: "index_purch_reqns_on_number"
    t.index ["plant_id"], name: "index_purch_reqns_on_plant_id"
    t.index ["purch_group_id"], name: "index_purch_reqns_on_purch_group_id"
    t.index ["purch_org_id"], name: "index_purch_reqns_on_purch_org_id"
    t.index ["updated_by_id"], name: "index_purch_reqns_on_updated_by_id"
  end

  create_table "roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "ident_name"
    t.string "resource_type"
    t.uuid "resource_id"
    t.string "state", default: "ACTIVE"
    t.uuid "created_by_id_id"
    t.uuid "updated_by_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.index ["created_by_id_id"], name: "index_roles_on_created_by_id_id"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
    t.index ["updated_by_id_id"], name: "index_roles_on_updated_by_id_id"
  end

  create_table "tasks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "number"
    t.string "name"
    t.uuid "taskable_id"
    t.string "taskable_type"
    t.json "data"
    t.string "state"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
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
    t.datetime "discarded_at", precision: nil
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid "party_id"
    t.uuid "user_type_id"
    t.string "state"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["party_id"], name: "index_users_on_party_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "role_id"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "vendor_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "ident_name"
    t.string "name"
    t.text "desc"
    t.boolean "system"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.date "from_date"
    t.date "thru_date"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.uuid "active_vendor_status_id"
    t.jsonb "data"
    t.uuid "vendor_type_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "party_id"
  end

  create_table "work_acceptance_note_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "number"
    t.uuid "work_acceptance_note_id"
    t.uuid "parent_id"
    t.uuid "purch_order_item_id"
    t.uuid "commodity_list_id"
    t.uuid "product_group_id"
    t.uuid "product_id"
    t.float "qty"
    t.uuid "measurement_unit_id"
    t.float "unit_price"
    t.float "price_unit"
    t.float "subtotal"
    t.boolean "sales_taxable"
    t.string "amount_type"
    t.uuid "wbsproject_id"
    t.uuid "cost_center_id"
    t.uuid "from_currency_id"
    t.float "from_amount"
    t.uuid "to_currency_id"
    t.uuid "to_amount"
    t.date "delivery_date"
    t.text "desc"
    t.text "specification"
    t.text "note"
    t.jsonb "data"
    t.datetime "deleted_at", precision: nil
    t.float "process_qty"
    t.float "process_unit_price"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_work_acceptance_note_items_on_created_by_id"
    t.index ["purch_order_item_id"], name: "index_work_acceptance_note_items_on_purch_order_item_id"
    t.index ["updated_by_id"], name: "index_work_acceptance_note_items_on_updated_by_id"
    t.index ["work_acceptance_note_id"], name: "index_work_acceptance_note_items_on_work_acceptance_note_id"
  end

  create_table "work_acceptance_notes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "number"
    t.string "sap_number"
    t.string "name"
    t.string "state", default: "DRAFT"
    t.uuid "current_workflow_instance_id"
    t.jsonb "data"
    t.string "wan_type"
    t.uuid "internal_org_id"
    t.uuid "purch_org_id"
    t.uuid "purch_group_id"
    t.uuid "plant_id"
    t.uuid "purch_order_id"
    t.uuid "vendor_id"
    t.uuid "to_currency"
    t.uuid "incoterm_id"
    t.uuid "incoterm_desc"
    t.decimal "payment_term_number"
    t.string "payment_term_desc"
    t.string "request_type_code"
    t.string "request_type"
    t.datetime "delivery_date", precision: nil
    t.text "desc"
    t.string "receiver"
    t.string "delivery_detail"
    t.text "remark"
    t.datetime "released_at", precision: nil
    t.datetime "rejected_at", precision: nil
    t.datetime "discard_at", precision: nil
    t.text "cancel_remark"
    t.uuid "reference_by_id"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "purch_reqn_id"
    t.index ["created_by_id"], name: "index_work_acceptance_notes_on_created_by_id"
    t.index ["number"], name: "index_work_acceptance_notes_on_number"
    t.index ["updated_by_id"], name: "index_work_acceptance_notes_on_updated_by_id"
  end

  create_table "workflow_instances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "instance_number"
    t.uuid "workflow_id"
    t.text "comment"
    t.string "workflowable_type"
    t.uuid "workflowable_id"
    t.string "state", default: "ACTIVE"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "discarded_at", precision: nil
    t.uuid "discarded_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workflow_step"
    t.uuid "workflow_step_id"
    t.index ["instance_number"], name: "index_workflow_instances_on_instance_number"
    t.index ["workflow_id"], name: "index_workflow_instances_on_workflow_id"
    t.index ["workflowable_type", "workflowable_id"], name: "index_workflow_instances_on_workflowable"
  end

  create_table "workflow_steps", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "workflow_id"
    t.string "name"
    t.string "ident_name"
    t.string "resource_name"
    t.integer "seq"
    t.json "opts"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "discarded_at", precision: nil
    t.uuid "discarded_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workflow_id"], name: "index_workflow_steps_on_workflow_id"
  end

  create_table "workflows", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "state", default: "ACTIVE"
    t.uuid "created_by_id"
    t.uuid "updated_by_id"
    t.datetime "discarded_at", precision: nil
    t.uuid "discarded_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
