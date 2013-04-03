class CreateFazendas < ActiveRecord::Migration
  def change
    create_table :fazendas do |t|
      t.integer :insc_base
      t.string :inscricao, :limit => 80
      t.string :proprietario, :limit => 100
      t.string :localizimovel, :limit => 100
      t.integer :numero
      t.string :compl, :limit => 80
      t.string :bairro, :limit => 80
      t.integer :codloteamento
      t.string :loteamento, :limit => 80
      t.integer :cep
      t.string :cpfcgc, :limit => 80
      t.string :identlote, :limit => 30
      t.string :identquadra, :limit => 30
      t.float :testada
      t.float :fracaocal
      t.float :fracaoideal
      t.float :areadolote
      t.float :areaconstruida
      t.string :situacao, :limit => 80
      t.string :tipoterreno, :limit => 40
      t.string :tipoobra, :limit => 40
      t.string :conservacao, :limit => 40
      t.string :padrao, :limit => 40
      t.string :responsavel, :limit => 80
      t.string :tipoimovel, :limit => 80
      t.string :beneficio, :limit => 80
      t.string :melhoria, :limit => 80
      t.string :endcorresp, :limit => 80
      t.string :numerocorresp, :limit => 80
      t.string :complcorresp, :limit => 80
      t.string :bairrocorresp, :limit => 80
      t.integer :cepcorresp
      t.string :cidadecorresp, :limit => 80
      t.string :uf, :limit => 2
      t.string :dtconstrucao, :limit => 11
      t.string :dtcadastro, :limit => 11

      t.timestamps
    end
  end
end
