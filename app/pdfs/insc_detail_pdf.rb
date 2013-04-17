class InscDetailPdf < Prawn::Document

	def initialize(fazenda, zoneamento)
		super(:top_margin => 40)
		@fazenda = fazenda
		@zoneamentos = zoneamento
		title
		line_items_fazenda
		line_items_zoneamento
	end

	def title
		#logopath = "#{RAILS_ROOT}/public/images/awesomecompany.jpg"
		text "Sistema de Consultas Georeferenciadas", :size => 20, :style => :bold
		move_down 30
		text "#{@fazenda.proprietario}", :size => 16, :style => :bold
	end

	def line_items_fazenda
		move_down 10
		table line_item_rows_fazenda do
			column(0).width = 150
			column(0).style(:font_style => :bold)
			column(1).width = 350
		end
	end

	def line_item_rows_fazenda
		[["Inscrição",@fazenda.inscricao],
		["Responsável",@fazenda.responsavel],
		["Padrão",@fazenda.padrao],
		["Tipo Obra",@fazenda.tipoobra],
		["CPF/CGC",@fazenda.cpfcgc],
		["Endereço:",@fazenda.localizimovel+", "+@fazenda.numero.to_s],
		["Complemento",@fazenda.compl],
		["Bairro",@fazenda.bairro],
		["Loteamento",@fazenda.loteamento],
		["CEP",@fazenda.cep],
		["Área do Lote",@fazenda.areadolote],
		["Área construída",@fazenda.areaconstruida]]
	end

	def line_items_zoneamento
		move_down 10
		table line_items_rows_zoneamento do
			row(0).font_style = :bold
			column(0).width = 150
			column(1).width = 350
		end
	end

	def line_items_rows_zoneamento
		[["Zoneamento", "Atividade"]] +
		@zoneamentos.map do |item|
			[item.sigla, item.atividade]
		end


	end




end