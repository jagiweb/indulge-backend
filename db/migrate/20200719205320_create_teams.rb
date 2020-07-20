class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.references :season, null: false, foreign_key: true
      t.string :name
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
