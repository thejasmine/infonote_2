class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :note
      t.datetime :meeting_time
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
