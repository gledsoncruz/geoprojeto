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

ActiveRecord::Schema.define(:version => 20130405132644) do

  create_table "fazendas", :force => true do |t|
    t.integer  "insc_base"
    t.string   "inscricao",      :limit => 80
    t.string   "proprietario",   :limit => 100
    t.string   "localizimovel",  :limit => 100
    t.integer  "numero"
    t.string   "compl",          :limit => 80
    t.string   "bairro",         :limit => 80
    t.integer  "codloteamento"
    t.string   "loteamento",     :limit => 80
    t.integer  "cep"
    t.string   "cpfcgc",         :limit => 80
    t.string   "identlote",      :limit => 30
    t.string   "identquadra",    :limit => 30
    t.float    "testada"
    t.float    "fracaocal"
    t.float    "fracaoideal"
    t.float    "areadolote"
    t.float    "areaconstruida"
    t.string   "situacao",       :limit => 80
    t.string   "tipoterreno",    :limit => 40
    t.string   "tipoobra",       :limit => 40
    t.string   "conservacao",    :limit => 40
    t.string   "padrao",         :limit => 40
    t.string   "responsavel",    :limit => 80
    t.string   "tipoimovel",     :limit => 80
    t.string   "beneficio",      :limit => 80
    t.string   "melhoria",       :limit => 80
    t.string   "endcorresp",     :limit => 80
    t.string   "numerocorresp",  :limit => 80
    t.string   "complcorresp",   :limit => 80
    t.string   "bairrocorresp",  :limit => 80
    t.integer  "cepcorresp"
    t.string   "cidadecorresp",  :limit => 80
    t.string   "uf",             :limit => 2
    t.string   "dtconstrucao",   :limit => 11
    t.string   "dtcadastro",     :limit => 11
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "lotesvrs", :force => true do |t|
    t.integer "insc_base"
    t.spatial "the_geom",  :limit => {:type=>"geometry", :srid=>29193}
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "role"
    t.boolean  "active"
    t.datetime "last_request_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
