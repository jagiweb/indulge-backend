class CreateMatch < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :start_date
      t.string :end_date
      t.string :stadium
      t.references :season, null: false, foreign_key: true
      t.references :home_participant, null: false, foreign_key: true
      t.references :visitor_participant, null: false, foreign_key: true
    end
  end
end
