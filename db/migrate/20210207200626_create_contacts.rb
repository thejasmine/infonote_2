class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :position
      t.string :email
      t.string :phone
      t.string :linkedIn
      t.string :short_note
      t.string :other_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
