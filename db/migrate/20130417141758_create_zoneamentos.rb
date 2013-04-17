class CreateZoneamentos < ActiveRecord::Migration
  def change
    create_table :zoneamentos do |t|
      t.string :sigla, :limit => 10
      t.string :desc, :limit => 100
      t.string :atividade, :limit => 100
      t.geometry :the_geom, :srid => 29193
    end
  end
end
