# -*- encoding : utf-8 -*-
class BairrosController < ApplicationController
  # GET /bairros
  # GET /bairros.json

  load_and_authorize_resource

  def index
    @bairros = Bairro.accessible_by(current_ability).paginate_by_sql(
      "select st_area(b.the_geom)/1000 as area, b.* from bairros_oficial b where b.nome like '%"+params[:search].to_s.upcase+"%' order by b.nome", :page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @bairros, :except => :the_geom}
      format.xml { render :xml => @bairros, :except => :the_geom }
    end
  end

  # GET /bairros/1
  # GET /bairros/1.json
  def show

    @bairro = Bairro.find_by_sql(
      "select st_area(b.the_geom)/1000 as area, b.* from bairros_oficial b where id ="+params[:id]+" order by b.nome")
    @ruas = Rua.paginate_by_sql("select r.*, st_length(st_intersection(r.the_geom, b.the_geom)) as parcial, st_length(r.the_geom) as total from ruas r, bairros_oficial b
              where r.the_geom && b.the_geom and
              st_intersects(r.the_geom, b.the_geom) and
              not id_rua = 0 and
              b.id = "+params[:id]+" order by r.nome", :page => params[:page], :per_page => 10)

    @educacaos = Educacao.find_by_sql("select e.* from educacao_municipal e, bairros_oficial b
                  where e.the_geom && b.the_geom and
                  st_intersects(e.the_geom, b.the_geom) and
                  b.id = "+params[:id]+" order by e.nome")

    @saudes = Saude.find_by_sql("select e.* from saude_municipal e, bairros_oficial b
                  where e.the_geom && b.the_geom and
                  st_intersects(e.the_geom, b.the_geom) and
                  b.id = "+params[:id]+" order by e.descricao")

    @pontosOnibus = PontosOnibus.find_by_sql("select e.* from ponto_onibus e, bairros_oficial b
                  where e.the_geom && b.the_geom and
                  st_intersects(e.the_geom, b.the_geom) and
                  b.id = "+params[:id]+" order by e.gid")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => [@bairro, @ruas, @educacaos, @saudes], :except => :the_geom }
      format.xml { render :xml => [@bairro, @ruas, @educacaos, @saudes] ,:except => :the_geom}
    end
  end

  # GET /bairros/new
  # GET /bairros/new.json
  def new
    @bairro = Bairro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @bairro }
    end
  end

  # GET /bairros/1/edit
  def edit
    @bairro = Bairro.find(params[:id])
  end

  # POST /bairros
  # POST /bairros.json
  def create
    @bairro = Bairro.new(params[:bairro])

    respond_to do |format|
      if @bairro.save
        format.html { redirect_to @bairro, :notice => 'Bairro was successfully created.' }
        format.json { render :json => @bairro, :status => :created, :location => @bairro }
      else
        format.html { render :action => "new" }
        format.json { render :json => @bairro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bairros/1
  # PUT /bairros/1.json
  def update
    @bairro = Bairro.find(params[:id])

    respond_to do |format|
      if @bairro.update_attributes(params[:bairro])
        format.html { redirect_to @bairro, :notice => 'Bairro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @bairro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bairros/1
  # DELETE /bairros/1.json
  def destroy
    @bairro = Bairro.find(params[:id])
    @bairro.destroy

    respond_to do |format|
      format.html { redirect_to bairros_url }
      format.json { head :no_content }
    end
  end
end
