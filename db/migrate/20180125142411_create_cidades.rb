class CreateCidades < ActiveRecord::Migration[5.1]
  def change
    create_table :cidades do |t|
      t.references :estado, foreign_key: true
      t.string :nome

      t.timestamps
    end
  end
end
