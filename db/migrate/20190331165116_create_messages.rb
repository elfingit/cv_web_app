class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :email
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
