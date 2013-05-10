# -*- encoding : utf-8 -*-
class AldeiaDigital < ActiveRecord::Base
  #attr_accessible :id_rua, :nome, :the_geom

  #self.rgeo_factory_generator = RGeo::Geos.factory_generator(:srid => 29193)
  self.table_name = "aldeia_digital_oficial"
  self.primary_key = 'gid'


end
