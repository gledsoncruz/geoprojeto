class CreateRuas < ActiveRecord::Migration
  def change
    create_table :ruas do |t|
      t.integer :id_rua
      t.string :nome, :limit => 100
      t.geometry :the_geom, :srid => 29193
    end
  end
end
