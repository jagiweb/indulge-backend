class CreateVisitorParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :visitor_participants do |t|
      t.integer :goals
      t.integer :yellow_cards
      t.integer :red_cards
      t.references :team, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
