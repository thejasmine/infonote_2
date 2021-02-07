class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :note
      t.datetime :time
      t.boolean :finish
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
