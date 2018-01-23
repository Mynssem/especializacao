class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :sobrenome
      t.string :email
      t.string :telefone
      t.datetime :data_nascimento

      t.timestamps
    end
  end
end
