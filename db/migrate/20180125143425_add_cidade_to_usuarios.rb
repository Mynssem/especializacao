class AddCidadeToUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_reference :usuarios, :cidade, foreign_key: true
  end
end
