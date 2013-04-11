class Fazenda < ActiveRecord::Base
  attr_accessible :areaconstruida, :areadolote, :bairro, :bairrocorresp, :beneficio, :cep, :cepcorresp, :cidadecorresp, :codloteamento, :compl, :complcorresp, :conservacao, :cpfcgc, :dtcadastro, :dtconstrucao, :endcorresp, :fracaocal, :fracaoideal, :identlote, :identquadra, :insc_base, :inscricao, :localizimovel, :loteamento, :melhoria, :numero, :numerocorresp, :padrao, :proprietario, :responsavel, :situacao, :testada, :tipoimovel, :tipoobra, :tipoterreno, :uf

  def self.search(search)

    if search
      where('proprietario LIKE ?', "#{search}%")
    else
      scoped
    end
  end



end