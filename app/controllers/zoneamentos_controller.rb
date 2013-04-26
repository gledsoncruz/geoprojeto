# -*- encoding : utf-8 -*-
class ZoneamentosController < ApplicationController
  # GET /zoneamentos
  # GET /zoneamentos.json
  def index
    @zoneamentos = Zoneamento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @zoneamentos }
    end
  end

  # GET /zoneamentos/1
  # GET /zoneamentos/1.json
  def show
    @zoneamento = Zoneamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @zoneamento }
    end
  end

  # GET /zoneamentos/new
  # GET /zoneamentos/new.json
  def new
    @zoneamento = Zoneamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @zoneamento }
    end
  end

  # GET /zoneamentos/1/edit
  def edit
    @zoneamento = Zoneamento.find(params[:id])
  end

  # POST /zoneamentos
  # POST /zoneamentos.json
  def create
    @zoneamento = Zoneamento.new(params[:zoneamento])

    respond_to do |format|
      if @zoneamento.save
        format.html { redirect_to @zoneamento, :notice => 'Zoneamento was successfully created.' }
        format.json { render :json => @zoneamento, :status => :created, :location => @zoneamento }
      else
        format.html { render :action => "new" }
        format.json { render :json => @zoneamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /zoneamentos/1
  # PUT /zoneamentos/1.json
  def update
    @zoneamento = Zoneamento.find(params[:id])

    respond_to do |format|
      if @zoneamento.update_attributes(params[:zoneamento])
        format.html { redirect_to @zoneamento, :notice => 'Zoneamento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @zoneamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /zoneamentos/1
  # DELETE /zoneamentos/1.json
  def destroy
    @zoneamento = Zoneamento.find(params[:id])
    @zoneamento.destroy

    respond_to do |format|
      format.html { redirect_to zoneamentos_url }
      format.json { head :no_content }
    end
  end
end
