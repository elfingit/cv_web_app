class CreateTechnologies < ActiveRecord::Migration[5.2]
  def change
    create_table :technologies do |t|
      t.string :title
      t.text :icon_url
      t.integer :hours

      t.timestamps
    end
  end
end
