# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
  	#@fazendas = Fazenda.find_by_sql("select count(*) as total, tipoimovel from edvaldo.vw_busca_inscricao group by tipoimovel order by tipoimovel")
  	@area = AbstractModelPostgis.find_by_sql("select st_area(the_geom)/1000 as area from limitevr_oficial")
  	@lenghtRua = AbstractModelPostgis.find_by_sql("select sum(st_length(the_geom)/1000) as km from eixo_rua")
  	@totBairros = AbstractModelPostgis.find_by_sql("select count(*) as total from bairros_oficial")
  	@totLoteamento = AbstractModelPostgis.find_by_sql("select count(*) as total from loteamento_vr")
  	@areaVerde = AbstractModelPostgis.find_by_sql("select sum(st_area(the_geom)/1000) as area_total from areas_verdes")
  	@pontosOnibus = AbstractModelPostgis.find_by_sql("select count(*) as total from ponto_onibus")
  	@antenas = AbstractModelPostgis.find_by_sql("select count(*) as total from aldeia_digital_oficial")
  	@cameras = AbstractModelPostgis.find_by_sql("select count(*) as total from cameras_seguranca")
  	@educacao = AbstractModelPostgis.find_by_sql("select count(*) as total from educacao_municipal")
  	@saude = AbstractModelPostgis.find_by_sql("select count(*) as total from saude_municipal")
  	@pracas = AbstractModelPostgis.find_by_sql("select count(*) as total from pracas")
  	@cras = AbstractModelPostgis.find_by_sql("select count(*) as total from cras")

  	respond_to do |format|
      format.html
    end
  end
end
