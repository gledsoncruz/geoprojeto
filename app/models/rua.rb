# -*- encoding : utf-8 -*-
class Rua < ActiveRecord::Base
  #attr_accessible :id_rua, :nome, :the_geom

  #self.rgeo_factory_generator = RGeo::Geos.factory_generator(:srid => 29193)
  self.table_name = "ruas"
  self.primary_key = 'id'

	def self.search(search)

	    if search
	      where('nome LIKE ?' , "%#{search.upcase}%")
	      #find_by_sql("select * from ruas where nome like '#{search.upcase}%'")
	    else
	      scoped
	    end
	end

end
