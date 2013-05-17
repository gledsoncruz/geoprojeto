# -*- encoding : utf-8 -*-
require "open-uri"
class InscDetailPdf < Prawn::Document

	def initialize(fazenda, zoneamento, user)
		super(:top_margin => 40)
		@fazenda = fazenda
		@zoneamentos = zoneamento
		@user = user
		logo
		cabecalho
		move_down 60
		text "Informações Gerais:", :style => :bold
		line_items_cabecalho
		move_down 10
		text "Informações do Cadastro:", :style => :bold
		line_items_fazenda
		move_down 10
		text "Informações de Zoneamento:", :style => :bold
		line_items_zoneamento
		move_down 10
		#titulo
		rodape
	end

	def logo
		y_position = cursor
	    logopath =  "#{Rails.root}/app/assets/images/brasao_img.jpg"
	    image logopath, :at => [0, y_position], :width => 80


  	end

	def cabecalho
		draw_text "Prefeitura Municipal de Volta Redonda", :size => 20, :style => :bold, :at => [bounds.width - 450, bounds.top - 20]
		move_down 30
		draw_text "EPD - Empresa de Processamento de Dados", :size => 16, :style => :bold, :at => [bounds.width - 450, bounds.top - 40]
		draw_text "Sistema de Consultas Georeferenciadas", :size => 16, :style => :bold, :at => [bounds.width - 450, bounds.top - 60]

	end

	def rodape
		string = "Página <page> de <total>"
		# Green page numbers 1 to 7
		options = { :at => [bounds.right - 150, 0],
		:width => 150,
		:align => :right,
		:page_filter => (1..7),
		:start_count_at => 1 }
		number_pages string, options

	end

	def titulo
	 str = open("http://upload.wikimedia.org/wikipedia/commons/9/97/The_Earth_seen_from_Apollo_17.jpg", :proxy_http_basic_authentication => [URI.parse("http://192.168.1.147:80"), "gledson.cruz", "1234"]).readlines
	 image str
	end

	def line_items_fazenda
		move_down 10
		table line_item_rows_fazenda do
			column(0).width = 150
			column(0).style(:font_style => :bold, :size => 10)
			column(1).width = 350
			column(1).style(:size => 10)
		end
	end

	def line_item_rows_fazenda
		[["Inscrição",@fazenda.inscricao],
		["Proprietário",@fazenda.proprietario],
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
			column(0).style(:size => 10)
			column(1).width = 350
			column(1).style(:size => 10)
		end
	end

	def line_items_rows_zoneamento
		[["Zoneamento", "Atividade"]] +
		@zoneamentos.map do |item|
			[item.zona, item.tipo_ativi]
		end


	end

	def line_items_rows_cabecalho
		[["Data da consulta: ", DateTime.now.utc.to_s(:data_br) +" - "+ Time.now.to_s(:hora)],
		["Usuário do Sistema:", @user.name],
		["IP da requisição:", @user.current_sign_in_ip]]

	end

	def line_items_cabecalho
		move_down 10
		table line_items_rows_cabecalho do
			#row(0).font_style = :bold
			column(0).width = 150
			column(0).style(:size => 10, :font_style => :bold)
			column(1).width = 350
			column(1).style(:size => 10)
		end
	end




end
