class CreateHomeParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :home_participants do |t|

      t.timestamps
    end
  end
end
