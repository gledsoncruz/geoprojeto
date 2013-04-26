# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  load_and_authorize_resource :except => [:edit, :show]

  def logged
    #User.find(:all, :conditions => ["current_sign_in_ip != '' "])
    @users = User.find(:all, :conditions => ['last_request_at >= ?', 5.minutes.ago.utc])
    respond_to do |format|
      format.html
      format.json { render :json => @users }
      format.xml { render :xml => @users }
    end

  end

  def index
    @users = User.accessible_by(current_ability).search(params[:search]).paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def show
    @user = User.accessible_by(current_ability).find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit

    @user = User.accessible_by(current_ability).find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path, :flash => { :success => 'Usuário criado com sucesso.' }
    else
      render :action => 'new'
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @user = User.accessible_by(current_ability).find(params[:id])

    if @user.update_attributes(params[:user])
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to users_path, :flash => { :success => 'Usuário alterado com sucesso.' }
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.accessible_by(current_ability).find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'Usuário apagado com sucesso.' }
  end

end
