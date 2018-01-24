class UsuariosController < ApplicationController
  #before_action :usuario_nao_logado
  before_action :set_usuario, only: [:show, :update, :edit, :destroy]
  before_action :usuario_nao_logado, except: [:new, :create]
  before_action :usuario_logado, only: [:new, :create]
  before_action :usuario_correto, only: [:edit, :update]
  before_action :usuario_correto_ou_admin, only: :destroy
  
  
  #GET usuarios/novo
  def new
    @usuario = Usuario.new 
  end
  
  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      flash[:notice] = "Bem vindo à SocialzIN."
      log_in @usuario

    else
      flash.now[:notice] = "Algo errado aconteceu."
      render "new"
    end
  end
  
  #GET usuarios/1
  #find e utilizado para encontrar um registro do db pelo seu id apenas 
  def show
  end
  
  #GET usuarios/editar/1
  def edit
  end

  #PATCH usuarios/editar/1
  def update
    if @usuario.update_attributes(usuario_params)
      redirect_to show_usuario_path(id: @usuario.id)
    else
      render "edit"
    end
	
  end

  #GET usuarios
  def index
    @usuarios = Usuario.all
  end
  #DELETE usuarios/1
  def destroy
    if @usuario.destroy
      redirect_to index_usuarios_path
    else
      redirect_to show_usuario_path(id: @usuario.id)
    end
  end

  private
  #este metodo impede que parametros indesejados entrem no nosso bd
  #boa pratica de segurança

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :sobrenome, :email, :data_nascimento, 
      :telefone, :password, :password_confirmation, :avatar)
  end
  
  def usuario_correto
    if current_user != @usuario
      flash[:alert] = "Não permitido."
      redirect_to show_usuario_path(id: current_user.id)
    end
  end
  
  def usuario_correto_ou_admin
     if !current_user.admin && current_user != @usuario
       flash[:alert] = "Não permitido."
       redirect_to show_usuario_path(id: current_user.id) 
     elsif current_user == @usuario && current_user.admin
       flash[:alert] = "Não permitido."
       redirect_to show_usuario_path(id: current_user.id)
       
     end
  end
end

