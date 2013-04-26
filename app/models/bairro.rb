# -*- encoding : utf-8 -*-
class Bairro < ActiveRecord::Base
	self.table_name = "bairros_oficial"
	self.primary_key = 'gid'
end
