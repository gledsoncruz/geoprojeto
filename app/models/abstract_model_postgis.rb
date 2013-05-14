# -*- encoding : utf-8 -*-
class AbstractModelPostgis < ActiveRecord::Base
	self.table_name = "bairros_oficial"
	self.primary_key = 'id'


end