# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100425145922) do

  create_table "addresses", :force => true do |t|
    t.string   "first_names", :null => false
    t.string   "surname",     :null => false
    t.string   "address_1",   :null => false
    t.string   "address_2"
    t.string   "city",        :null => false
    t.string   "post_code",   :null => false
    t.integer  "country_id",  :null => false
    t.string   "state"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "iso_code",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["iso_code"], :name => "index_countries_on_iso_code", :unique => true
  add_index "countries", ["name"], :name => "index_countries_on_name", :unique => true

  create_table "currencies", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "symbol",     :null => false
    t.string   "iso_code",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "currencies", ["iso_code"], :name => "index_currencies_on_iso_code", :unique => true
  add_index "currencies", ["name"], :name => "index_currencies_on_name", :unique => true
  add_index "currencies", ["symbol"], :name => "index_currencies_on_symbol", :unique => true

  create_table "payments", :force => true do |t|
    t.decimal  "amount",              :precision => 8, :scale => 2, :null => false
    t.integer  "currency_id",                                       :null => false
    t.string   "description",                                       :null => false
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "billing_address_id",                                :null => false
    t.integer  "delivery_address_id"
  end

  add_index "payments", ["currency_id"], :name => "index_payments_on_currency_id"

  create_table "sage_pay_transactions", :force => true do |t|
    t.string   "vendor"
    t.string   "security_key"
    t.integer  "payment_id",                                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "our_transaction_code"
    t.string   "sage_transaction_code"
    t.string   "status"
    t.string   "authorisation_code"
    t.boolean  "avs_cv2_matched"
    t.boolean  "address_matched"
    t.boolean  "post_code_matched"
    t.boolean  "cv2_matched"
    t.boolean  "gift_aid"
    t.boolean  "threed_secure_ok"
    t.string   "card_type"
    t.string   "last_4_digits"
    t.string   "transaction_type",      :default => "payment", :null => false
  end

  add_index "sage_pay_transactions", ["our_transaction_code"], :name => "index_sage_pay_transactions_on_our_transaction_code"
  add_index "sage_pay_transactions", ["payment_id"], :name => "index_sage_pay_transactions_on_payment_id"
  add_index "sage_pay_transactions", ["sage_transaction_code"], :name => "index_sage_pay_transactions_on_sage_transaction_code"

end
