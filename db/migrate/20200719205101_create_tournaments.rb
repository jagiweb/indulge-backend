class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :country
      t.string :city
      t.integer :type

      t.timestamps
    end
  end
end
