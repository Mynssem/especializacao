module SessoesHelper
  def log_in(usuario)
    session[:usuario_id] = usuario.id
    redirect_to show_usuario_path(id: usuario.id)
  end

  def current_user
    nil || Usuario.find_by(id: session[:usuario_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:usuario_id)
    redirect_to login_path
  end

  def usuario_logado
    if logged_in?
      redirect_to show_usuario_path(id: current_user.id)
    end
  end

  def usuario_nao_logado
    if !logged_in?
      redirect_to login_path
    end
  end

end
