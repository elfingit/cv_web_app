class AddUrlToSocial < ActiveRecord::Migration[5.2]
  def change
    add_column :socials, :url, :text
  end
end
