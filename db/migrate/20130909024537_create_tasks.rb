class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed
      t.references :project

      t.timestamps
    end
  end
end
