class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :usuario, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
