# -*- encoding : utf-8 -*-
class Zoneamento < ActiveRecord::Base
  #attr_accessible :atividade, :desc, :sigla

  #self.rgeo_factory_generator = RGeo::Geos.factory_generator(:srid => 29193)
  self.table_name = "zonas"
  self.primary_key = 'gid'


end
