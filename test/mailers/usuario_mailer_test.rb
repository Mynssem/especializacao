require 'test_helper'

class UsuarioMailerTest < ActionMailer::TestCase
  test "esqueci_minha_senha" do
    mail = UsuarioMailer.esqueci_minha_senha
    assert_equal "Esqueci minha senha", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
