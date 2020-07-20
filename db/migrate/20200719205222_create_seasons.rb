class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.references :tournament, null: false, foreign_key: true
      t.string :name
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
