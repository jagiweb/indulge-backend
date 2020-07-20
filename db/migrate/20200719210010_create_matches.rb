class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :season, null: false, foreign_key: true
      t.string :start_date
      t.string :end_date
      t.string :stadium

      t.timestamps
    end
  end
end
