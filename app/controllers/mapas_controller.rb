class MapasController < ApplicationController
  def index
  end

  def show
  	@fazendas = Fazenda.accessible_by(current_ability).search(params[:search].upcase).paginate(:conditions => ['insc_base = ?', params[:insc_base]], :page => params[:page], :per_page => 10).order('inscricao')
  	#@fazendas = Fazenda.accessible_by(current_ability).search(params[:search]).paginate(:page => params[:page], :per_page => 10).order('inscricao')
  end
end
