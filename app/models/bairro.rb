# -*- encoding : utf-8 -*-
class Bairro < ActiveRecord::Base
	self.table_name = "bairros_oficial"
	self.primary_key = 'id'


	def self.search(search)

    if search
      where('nome LIKE ?', "%#{search.upcase}%")
    else
      scoped
    end
  end


end
