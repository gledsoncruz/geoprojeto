# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Geo::Application.initialize!

config.gem "activerecord-oracle_enhanced-adapter", :lib => "active_record/connection_adapters/oracle_enhanced_adapter"
Time::DATE_FORMATS[:data_br] = "%d/%m/%Y"
Time::DATE_FORMATS[:dia_semana] = "%A"
Time::DATE_FORMATS[:hora] = "%H:%M:%S"
