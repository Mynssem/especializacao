class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.references :usuario, foreign_key: true
      t.references :post, foreign_key: true
      t.string :conteudo

      t.timestamps
    end
  end
end
