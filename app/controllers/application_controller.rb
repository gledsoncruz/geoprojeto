class ApplicationController < ActionController::Base
  #protect_from_forgery


  before_filter :authenticate_user!, :admin_filter_registrations, :set_last_request_at

  rescue_from CanCan::AccessDenied do |exception|
        flash[:alert] = "Você não possui privilégio para realizar esta operação. Entre em contato com o administrador do sistema." #exception.message
        redirect_to root_url
    end


  rescue_from ActiveRecord::RecordNotFound do
  	render_404
  end

  def render_404
  respond_to do |format|
    format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
    format.xml  { head :not_found }
    format.any  { head :not_found }
   end
  end


def admin_filter_registrations

     if (controller_name == 'registrations' && action_name == 'new')
          redirect_to root_url
     end
end

private

  def set_last_request_at
    current_user.update_attribute(:last_request_at, Time.now) if
    user_signed_in?
  end

end
