class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.date :deadline, null: false
      t.date :end_date
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
