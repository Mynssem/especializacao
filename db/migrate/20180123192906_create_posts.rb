class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :usuario, foreign_key: true
      t.string :conteudo

      t.timestamps
    end
  end
end
