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

ActiveRecord::Schema.define(:version => 20130402114939) do

  create_table "aldeia_digital_oficial", :id => false, :force => true do |t|
    t.integer "gid",                                                :null => false
    t.integer "id"
    t.string  "name",     :limit => 100
    t.string  "descr",    :limit => 250
    t.string  "folder",   :limit => 100
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"point"}
    t.string  "status",   :limit => 1
    t.text    "situacao"
    t.text    "tipo"
  end

  create_table "areas_parquimetros", :id => false, :force => true do |t|
    t.integer "gid",                                                    :null => false
    t.string  "desc_area",  :limit => 50
    t.string  "desc_setor", :limit => 30
    t.spatial "the_geom",   :limit => {:srid=>29193, :type=>"polygon"}
  end

  create_table "areas_risco", :id => false, :force => true do |t|
    t.integer "gid",                                                :null => false
    t.string  "solicita", :limit => 50
    t.string  "cadastro", :limit => 50
    t.string  "risco",    :limit => 50
    t.string  "problema", :limit => 50
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"point"}
  end

  create_table "areas_verdes", :id => false, :force => true do |t|
    t.integer "gid",                                                  :null => false
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"polygon"}
  end

  create_table "areas_verdes_fazenda", :id => false, :force => true do |t|
    t.integer "gid",                                                  :null => false
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"polygon"}
  end

  create_table "bairros", :id => false, :force => true do |t|
    t.integer "gid",                                         :null => false
    t.integer "id"
    t.string  "bairro",   :limit => 80
    t.integer "poptotal"
    t.integer "pop_masc"
    t.integer "pop_fem"
    t.spatial "the_geom", :limit => {:no_constraints=>true}
  end

  create_table "bairros_oficial", :id => false, :force => true do |t|
    t.integer "gid",                                                        :null => false
    t.integer "id"
    t.string  "bairro",   :limit => 30
    t.integer "poptotal"
    t.integer "pop_masc"
    t.integer "pop_fem"
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"multi_polygon"}
  end

  create_table "brasil_municipios", :id => false, :force => true do |t|
    t.integer "gid",                                                                                         :null => false
    t.integer "id"
    t.string  "nome_uf",    :limit => 23
    t.string  "regiao",     :limit => 15
    t.string  "cod_mes",    :limit => 11
    t.string  "n_meso",     :limit => 41
    t.string  "cod_mic",    :limit => 10
    t.string  "n_micro",    :limit => 43
    t.string  "n_munic1",   :limit => 37
    t.string  "cod_uf",     :limit => 9
    t.string  "cod_mun",    :limit => 11
    t.integer "area_1997"
    t.float   "esper_2000"
    t.integer "alfab_2000"
    t.decimal "frequ_2000",                                                   :precision => 10, :scale => 0
    t.float   "renda_2000"
    t.decimal "long_2000",                                                    :precision => 10, :scale => 0
    t.float   "educ_2000"
    t.integer "i_renda_00"
    t.integer "idh_2000"
    t.decimal "c_uf_2000",                                                    :precision => 10, :scale => 0
    t.decimal "c_nac_2000",                                                   :precision => 10, :scale => 0
    t.float   "esper_1991"
    t.integer "alfab_1991"
    t.decimal "frequ_1991",                                                   :precision => 10, :scale => 0
    t.float   "renda_1991"
    t.decimal "long_1991",                                                    :precision => 10, :scale => 0
    t.float   "educ_1991"
    t.integer "i_renda_91"
    t.integer "idh_1991"
    t.decimal "c_uf_1991",                                                    :precision => 10, :scale => 0
    t.decimal "c_nacional",                                                   :precision => 10, :scale => 0
    t.spatial "the_geom",   :limit => {:srid=>29193, :type=>"multi_polygon"}
  end

  create_table "cameras_seguranca", :id => false, :force => true do |t|
    t.integer "gid",                                                   :null => false
    t.string  "descricao",   :limit => 20
    t.string  "localizacao", :limit => 60
    t.string  "modelo",      :limit => 50
    t.string  "montagem",    :limit => 30
    t.string  "tipo",        :limit => 50
    t.string  "tipo2",       :limit => 50
    t.integer "id"
    t.spatial "the_geom",    :limit => {:srid=>29193, :type=>"point"}
  end

  create_table "ciclovias", :id => false, :force => true do |t|
    t.integer "gid",                                                            :null => false
    t.integer "id"
    t.string  "tipo",     :limit => 30
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "cicuta", :id => false, :force => true do |t|
    t.integer "gid",                                                        :null => false
    t.integer "id"
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"multi_polygon"}
  end

  create_table "cras", :id => false, :force => true do |t|
    t.integer "gid",                                                       :null => false
    t.string  "desc_cras",       :limit => 100
    t.string  "end_cras",        :limit => 50
    t.string  "tel_cras",        :limit => 20
    t.spatial "the_geom",        :limit => {:srid=>29193, :type=>"point"}
    t.string  "dta_implantacao", :limit => 15
    t.string  "ibge",            :limit => 20
    t.string  "tipo",            :limit => 50
    t.integer "tipo_id"
    t.integer "regional_id"
  end

  create_table "cras_regional", :id => false, :force => true do |t|
    t.integer "id",                                :null => false
    t.string  "descricao_regional", :limit => 100
  end

  create_table "cras_tipo", :id => false, :force => true do |t|
    t.integer "id",                       :null => false
    t.string  "sigla",     :limit => 10
    t.string  "descricao", :limit => 100
  end

  create_table "edificacao", :id => false, :force => true do |t|
    t.integer "gid",                                                        :null => false
    t.decimal "area"
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"multi_polygon"}
  end

  create_table "educacao_municipal", :id => false, :force => true do |t|
    t.integer "gid",                                                :null => false
    t.string  "polo",     :limit => 3
    t.integer "cadastro"
    t.string  "ensino",   :limit => 30
    t.string  "nome",     :limit => 40
    t.string  "tipo",     :limit => 30
    t.string  "ramal",    :limit => 15
    t.string  "endereco", :limit => 100
    t.string  "email",    :limit => 50
    t.string  "visada",   :limit => 50
    t.string  "situacao", :limit => 10
    t.string  "obs",      :limit => 100
    t.integer "numero"
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"point"}
  end

  create_table "eixo_rua", :id => false, :force => true do |t|
    t.integer "gid",                                                             :null => false
    t.integer "id_rua",    :limit => 8
    t.integer "id_bairro"
    t.integer "id_lot"
    t.integer "join_num",  :limit => 8
    t.string  "nome",      :limit => 50
    t.string  "tipo_rua",  :limit => 15
    t.spatial "the_geom",  :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "erosao", :id => false, :force => true do |t|
    t.integer "gid",                                                             :null => false
    t.string  "entity",    :limit => 14
    t.string  "layer",     :limit => 32
    t.float   "elevation"
    t.float   "thickness"
    t.integer "color"
    t.spatial "the_geom",  :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "estrada_de_ferro", :id => false, :force => true do |t|
    t.integer "gid",                                                              :null => false
    t.string  "entity",     :limit => 14
    t.string  "layer",      :limit => 32
    t.float   "level"
    t.decimal "elevation"
    t.integer "color"
    t.float   "mslink_dmr"
    t.spatial "the_geom",   :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "extended_geometry_columns", :id => false, :force => true do |t|
    t.string "f_table_schema", :limit => 265, :null => false
    t.string "f_table_name",   :limit => 256, :null => false
    t.float  "x_min"
    t.float  "y_min"
    t.float  "x_max"
    t.float  "y_max"
  end

  create_table "fazendas", :id => false, :force => true do |t|
    t.integer "gid",                                                  :null => false
    t.string  "nome",     :limit => 50
    t.string  "obs",      :limit => 50
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"polygon"}
  end

  create_table "geomorfologia", :id => false, :force => true do |t|
    t.integer "gid",                                                        :null => false
    t.string  "def",      :limit => 150
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"multi_polygon"}
  end

  create_table "limite_barra_mansa", :id => false, :force => true do |t|
    t.integer "gid",                                                                                        :null => false
    t.string  "codigo",    :limit => 16
    t.string  "nome",      :limit => 50
    t.decimal "populacao",                                                   :precision => 10, :scale => 0
    t.float   "area97"
    t.string  "uf",        :limit => 2
    t.string  "nome2",     :limit => 50
    t.decimal "vendas"
    t.spatial "the_geom",  :limit => {:srid=>29193, :type=>"multi_polygon"}
  end

  create_table "limite_municipal", :id => false, :force => true do |t|
    t.integer "id",                                                    :null => false
    t.string  "descricao", :limit => 50
    t.spatial "the_geom",  :limit => {:srid=>29193, :type=>"polygon"}
  end

  create_table "limitevr_oficial", :id => false, :force => true do |t|
    t.integer "gid",                                                   :null => false
    t.string  "ENTITY",    :limit => 14
    t.string  "LAYER",     :limit => 32
    t.float   "ELEVATION"
    t.float   "THICKNESS"
    t.integer "COLOR"
    t.spatial "the_geom",  :limit => {:srid=>29193, :type=>"polygon"}
  end

  create_table "loteamento_vr", :id => false, :force => true do |t|
    t.integer "gid",                                                          :null => false
    t.text    "lot_codigo"
    t.text    "lot_desc"
    t.text    "lot_proces"
    t.text    "lot_topogr"
    t.float   "lote_area"
    t.text    "lot_origem"
    t.text    "lot_prefei"
    t.text    "lot_engenh"
    t.text    "lot_crea"
    t.text    "lot_regiao"
    t.text    "lot_lotead"
    t.text    "lot_dtapro"
    t.spatial "the_geom",   :limit => {:srid=>29183, :type=>"multi_polygon"}
  end

  create_table "lotesvr", :id => false, :force => true do |t|
    t.integer "gid",                                                                                         :null => false
    t.decimal "__gid",                                                        :precision => 10, :scale => 0
    t.decimal "cadastro",                                                     :precision => 10, :scale => 0
    t.string  "observacao", :limit => 100
    t.decimal "geo_id"
    t.decimal "tipo",                                                         :precision => 10, :scale => 0
    t.decimal "cod_pend",                                                     :precision => 10, :scale => 0
    t.spatial "the_geom",   :limit => {:srid=>29193, :type=>"multi_polygon"}
  end

  create_table "meio_fio", :id => false, :force => true do |t|
    t.integer "gid",                                                            :null => false
    t.integer "meiofios", :limit => 8
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "parquimetros", :id => false, :force => true do |t|
    t.integer "gid",                                                   :null => false
    t.string  "commentario", :limit => 32
    t.float   "pdop_m_xim"
    t.string  "tipo_de_co",  :limit => 36
    t.string  "tipo_de_re",  :limit => 36
    t.date    "data_gps"
    t.string  "hora_gps",    :limit => 10
    t.string  "nome_da_ca",  :limit => 20
    t.string  "arquivo_de",  :limit => 20
    t.integer "posi_oes_n"
    t.integer "posi_oes_f"
    t.string  "atualizar_",  :limit => 36
    t.float   "desvio_pad"
    t.float   "altura_gps"
    t.float   "precisao_h"
    t.float   "precisao_v"
    t.float   "dir_norte"
    t.float   "dir_leste"
    t.integer "id_ponto"
    t.string  "nome_do_di",  :limit => 20
    t.integer "semana_gps"
    t.float   "segundo_gp"
    t.integer "id1"
    t.float   "gmrotation"
    t.integer "id_parq"
    t.spatial "the_geom",    :limit => {:srid=>29193, :type=>"point"}
  end

  create_table "passarelas", :id => false, :force => true do |t|
    t.integer "gid",                                                              :null => false
    t.string  "entity",     :limit => 14
    t.string  "layer",      :limit => 32
    t.float   "level"
    t.decimal "elevation"
    t.integer "color"
    t.float   "mslink_dmr"
    t.spatial "the_geom",   :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "pontes_viadutos", :id => false, :force => true do |t|
    t.integer "gid",                                                             :null => false
    t.string  "entity",    :limit => 14
    t.string  "layer",     :limit => 32
    t.float   "level"
    t.decimal "elevation"
    t.integer "color"
    t.spatial "the_geom",  :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "ponto_onibus", :id => false, :force => true do |t|
    t.integer "gid",                                                   :null => false
    t.string  "cobertura",   :limit => 20
    t.string  "sinalizacao", :limit => 20
    t.string  "capacidade",  :limit => 20
    t.string  "banco",       :limit => 20
    t.string  "piso_pav",    :limit => 20
    t.string  "iluminacao",  :limit => 20
    t.float   "pdop_m_xim"
    t.string  "tipo_de_co",  :limit => 36
    t.string  "tipo_de_re",  :limit => 36
    t.date    "data_gps"
    t.string  "hora_gps",    :limit => 10
    t.string  "nome_da_ca",  :limit => 20
    t.string  "arquivo_de",  :limit => 20
    t.integer "posi_oes_n"
    t.integer "posi_oes_f"
    t.string  "atualizar_",  :limit => 36
    t.float   "desvio_pad"
    t.float   "altura_gps"
    t.float   "precisao_h"
    t.float   "precisao_v"
    t.float   "dir_norte"
    t.float   "dir_leste"
    t.integer "id_ponto"
    t.string  "nome_do_di",  :limit => 20
    t.integer "semana_gps"
    t.float   "segundo_gp"
    t.integer "id"
    t.float   "gmrotation"
    t.spatial "the_geom",    :limit => {:srid=>29193, :type=>"point"}
  end

  create_table "postes", :id => false, :force => true do |t|
    t.integer "gid",                                                             :null => false
    t.string  "entity",    :limit => 14
    t.string  "layer",     :limit => 32
    t.float   "level"
    t.decimal "elevation"
    t.integer "color"
    t.spatial "the_geom",  :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "pracas", :id => false, :force => true do |t|
    t.integer "gid",                                                          :null => false
    t.string  "bairro",     :limit => 30
    t.string  "nome",       :limit => 50
    t.decimal "shape_area"
    t.decimal "shape_len"
    t.spatial "the_geom",   :limit => {:srid=>29193, :type=>"multi_polygon"}
  end

  create_table "rede_agua", :id => false, :force => true do |t|
    t.integer "gid",                                                                                             :null => false
    t.decimal "id",                                                               :precision => 10, :scale => 0
    t.integer "diametro"
    t.decimal "profundida"
    t.date    "data_cadas"
    t.spatial "the_geom",   :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "rede_esgoto", :id => false, :force => true do |t|
    t.integer "gid",                                                                                             :null => false
    t.decimal "id",                                                               :precision => 10, :scale => 0
    t.integer "diametro"
    t.date    "data_const"
    t.spatial "the_geom",   :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "rio_paraiba_sul", :id => false, :force => true do |t|
    t.integer "gid",                                                        :null => false
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"multi_polygon"}
  end

  create_table "ruas", :id => false, :force => true do |t|
    t.integer "id",                                          :null => false
    t.integer "id_rua",   :limit => 8
    t.string  "nome",     :limit => 50
    t.string  "tipo_rua", :limit => 15
    t.spatial "the_geom", :limit => {:no_constraints=>true}
  end

  create_table "saude_municipal", :id => false, :force => true do |t|
    t.integer "gid",                                                  :null => false
    t.integer "unidade",    :limit => 2
    t.string  "descricao",  :limit => 30
    t.string  "endereco",   :limit => 80
    t.string  "tel_ramal",  :limit => 30
    t.string  "tipo",       :limit => 10
    t.string  "hora_funci", :limit => 40
    t.string  "responsave", :limit => 50
    t.spatial "the_geom",   :limit => {:srid=>29193, :type=>"point"}
  end

  create_table "setores_orcamento_participativo", :id => false, :force => true do |t|
    t.integer "gid",                                          :null => false
    t.integer "id"
    t.string  "descricao", :limit => 80
    t.spatial "the_geom",  :limit => {:no_constraints=>true}
  end

  create_table "tb_versions", :id => false, :force => true do |t|
    t.integer "id", :null => false
  end

  create_table "tipo_lote", :id => false, :force => true do |t|
    t.integer "id",                       :null => false
    t.integer "cod"
    t.string  "descricao", :limit => 100
  end

  create_table "unidades_de_conservacao", :id => false, :force => true do |t|
    t.integer "gid",                                                   :null => false
    t.string  "descricao", :limit => 50
    t.string  "tipo",      :limit => 50
    t.spatial "the_geom",  :limit => {:srid=>29193, :type=>"polygon"}
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

  create_table "vias_arteriais", :id => false, :force => true do |t|
    t.integer "gid",                                                            :null => false
    t.integer "id"
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"multi_line_string"}
  end

  create_table "zona_de_conservacao_ambiental", :id => false, :force => true do |t|
    t.integer "gid",                                                  :null => false
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"polygon"}
  end

  create_table "zona_de_expansao_urbana", :id => false, :force => true do |t|
    t.integer "gid",                                                  :null => false
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"polygon"}
  end

  create_table "zona_rural", :id => false, :force => true do |t|
    t.integer "gid",                                                  :null => false
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"polygon"}
  end

  create_table "zona_urbana", :id => false, :force => true do |t|
    t.integer "gid",                                                  :null => false
    t.spatial "the_geom", :limit => {:srid=>29193, :type=>"polygon"}
  end

  create_table "zonas", :id => false, :force => true do |t|
    t.integer "gid",                                                    :null => false
    t.string  "zona",       :limit => 6
    t.integer "id_siitua"
    t.string  "desc_situa", :limit => 15
    t.string  "tipo_ativi", :limit => 50
    t.spatial "the_geom",   :limit => {:srid=>29193, :type=>"polygon"}
  end

end
