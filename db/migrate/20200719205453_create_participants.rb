class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.integer :goals
      t.integer :yellow_cards
      t.integer :red_cards
      t.integer :status

      t.timestamps
    end
  end
end
