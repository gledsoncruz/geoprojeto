class AbstractConnection < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "oracle_#{Rails.env}"
end
