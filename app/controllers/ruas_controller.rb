# -*- encoding : utf-8 -*-
class RuasController < ApplicationController
  # GET /ruas
  # GET /ruas.json
  load_and_authorize_resource
  def index

    nome = params[:search]

    if nome.present?
      @ruas = Rua.paginate_by_sql("SELECT b.gid as id_bairro, b.bairro, r.*
                        from ruas r, bairros_oficial b
                        where r.nome like '%"+nome.upcase+"%' and
                        r.the_geom && b.the_geom and
                        st_intersects(r.the_geom, b.the_geom)", :page => params[:page], :per_page => 10)
    else
      @ruas.clear
    end


    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @ruas }
      format.json { render :json => @ruas }
    end
  end

  def detail
    @rua = Rua.find_by_sql("SELECT b.gid as id_bairro, b.bairro, r.*
                        from ruas r, bairros_oficial b
                        where r.id = "+params[:id]+" and
                        b.gid = "+params[:id_bairro]+" and
                        r.the_geom && b.the_geom and
                        st_intersects(r.the_geom, b.the_geom)")
  end




  # GET /ruas/1
  # GET /ruas/1.json
  def show
    #@@rua = Rua.find(params[:id])

    @rua = Rua.find_by_sql("SELECT b.gid as id_bairro, b.bairro, r.*, st_length(r.the_geom) as tamanho,
                        st_length(st_intersection(r.the_geom, b.the_geom))  as parcial
                        from ruas r, bairros_oficial b
                        where r.id = "+params[:id]+" and
                        b.gid = "+params[:id_bairro]+" and
                        r.the_geom && b.the_geom and
                        st_intersects(r.the_geom, b.the_geom)")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rua }
    end
  end

  # GET /ruas/new
  # GET /ruas/new.json
  def new
    @rua = Rua.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @rua }
    end
  end

  # GET /ruas/1/edit
  def edit
    @rua = Rua.find(params[:id])
  end

  # POST /ruas
  # POST /ruas.json
  def create
    @rua = Rua.new(params[:rua])

    respond_to do |format|
      if @rua.save
        format.html { redirect_to @rua, :notice => 'Rua was successfully created.' }
        format.json { render :json => @rua, :status => :created, :location => @rua }
      else
        format.html { render :action => "new" }
        format.json { render :json => @rua.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ruas/1
  # PUT /ruas/1.json
  def update
    @rua = Rua.find(params[:id])

    respond_to do |format|
      if @rua.update_attributes(params[:rua])
        format.html { redirect_to @rua, :notice => 'Rua was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @rua.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ruas/1
  # DELETE /ruas/1.json
  def destroy
    @rua = Rua.find(params[:id])
    @rua.destroy

    respond_to do |format|
      format.html { redirect_to ruas_url }
      format.json { head :no_content }
    end
  end
end
