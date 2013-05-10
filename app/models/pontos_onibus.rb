# -*- encoding : utf-8 -*-
class PontosOnibus < ActiveRecord::Base
  #attr_accessible :id_rua, :nome, :the_geom

  #self.rgeo_factory_generator = RGeo::Geos.factory_generator(:srid => 29193)
  self.table_name = "ponto_onibus"
  self.primary_key = 'gid'


end