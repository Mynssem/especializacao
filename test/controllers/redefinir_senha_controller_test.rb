require 'test_helper'

class RedefinirSenhaControllerTest < ActionDispatch::IntegrationTest
  test "should get busca" do
    get redefinir_senha_busca_url
    assert_response :success
  end

end
