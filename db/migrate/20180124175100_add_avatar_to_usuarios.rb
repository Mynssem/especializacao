class AddAvatarToUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :avatar, :string
  end
end
