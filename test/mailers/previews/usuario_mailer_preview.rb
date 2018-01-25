# Preview all emails at http://localhost:3000/rails/mailers/usuario_mailer
class UsuarioMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/usuario_mailer/esqueci_minha_senha
  def esqueci_minha_senha
    UsuarioMailer.esqueci_minha_senha
  end

end
