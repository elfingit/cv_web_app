class CreateTechnologiesPortfoliosJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :portfolios, :technologies do |t|
      t.belongs_to :portfolios, index: true
      t.belongs_to :technologies, index: true
    end
  end
end
