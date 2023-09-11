class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :deadline
      t.date :end_date
      t.boolean :active

      t.timestamps
    end
  end
end
