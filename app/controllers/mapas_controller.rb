class MapasController < ApplicationController
  def index
  end

  def show
  	@fazendas = Fazenda.accessible_by(current_ability).search(params[:search]).paginate(:conditions => ['insc_base = ?', params[:insc_base]], :page => params[:page], :per_page => 10).order('inscricao')
  	respond_to do |format|
      format.html
      format.json { render :json => @fazendas }
      format.js
    end
  end

  def detail
  	@fazenda = Fazenda.accessible_by(current_ability).find(params[:id])
    @zoneamentos = Zoneamento.find_by_sql("SELECT distinct on (sigla) sigla, atividade from zoneamentos, lotesvrs where lotesvrs.insc_base = "+@fazenda.insc_base.to_s+" and lotesvrs.the_geom && zoneamentos.the_geom and st_intersects(lotesvrs.the_geom, zoneamentos.the_geom)")
  	respond_to do |format|
      format.html
      format.xml { render :xml => [@fazenda, @zoneamentos] }
      format.json { render :json => [@fazenda, @zoneamentos] }
      format.js
      format.pdf do
        pdf = InscDetailPdf.new(@fazenda, @zoneamentos)
        send_data pdf.render, :filename => "#{@fazenda.inscricao}.pdf",
                              :type => "application/pdf",
                              :disposition => "inline"
      end
    end
  end
=begin

  def geolotes

  	@lotesvrs = Lotesvr.paginate_by_sql(["select id, st_transform(l.the_geom, 4326)as the_geom, l.insc_base from lotesvrs l where l.insc_base = ?", params[:insc_base]], :page => params[:page], :per_page => 10)
    factory = RGeo::GeoJSON::EntityFactory.instance
    features = []

    @lotesvrs.each do |lote|
        features.push(factory.feature(lote.the_geom, nil, { :insc_base => lote.insc_base}))
    end

    collection = factory.feature_collection(features)

  	respond_to do |format|
      format.html
      format.json { render :json => RGeo::GeoJSON.encode(collection) }
      format.js
    end

  end
=end

end
