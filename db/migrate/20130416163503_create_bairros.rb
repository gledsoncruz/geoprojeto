class CreateBairros < ActiveRecord::Migration
  def change
    create_table :bairros do |t|
      t.string :nome, :limit => 100
      t.integer :popmasc
      t.integer :popfem
      t.geometry :the_geom, :srid => 29193
    end
  end
end
