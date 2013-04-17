class Bairro < ActiveRecord::Base
  attr_accessible :nome, :popfem, :popmasc, :the_geom
end
