class CreateVisitorParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :visitor_participants do |t|

      t.timestamps
    end
  end
end
