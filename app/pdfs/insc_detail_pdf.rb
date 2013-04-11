class InscDetailPdf < Prawn::Document

	def initialize(fazenda)
		super(:top_margin => 40)
		@fazenda = fazenda
		title
		line_items
	end

	def title
		#logopath = "#{RAILS_ROOT}/public/images/awesomecompany.jpg"
		text "Sistema de Consultas Georeferenciadas", :size => 20, :style => :bold
		move_down 30
		text "#{@fazenda.proprietario}", :size => 16, :style => :bold
	end

	def line_items
		move_down 10
		table line_item_rows do
			column(0).width = 150
			column(0).style(:font_style => :bold)
			column(1).width = 350
		end
	end

	def line_item_rows
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




end