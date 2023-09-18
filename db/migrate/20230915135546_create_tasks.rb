class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :priority, null: false
      t.boolean :status, null: false, default: false
      t.date :due_date, null: false
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
