# -*- encoding : utf-8 -*-
class Bairro < ActiveRecord::Base
	self.table_name = "bairros_oficial"
	self.primary_key = 'gid'


	def self.search(search)

    if search
      where('bairro LIKE ?', "%#{search.upcase}%")
    else
      scoped
    end
  end


end
