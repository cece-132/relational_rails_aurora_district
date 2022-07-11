class CreateDaycares < ActiveRecord::Migration[5.2]
  def change
    create_table :daycares do |t|
      t.string :name
      t.integer :total_teachers
      t.integer :total_students
      t.boolean :enrollment_full

      t.timestamps
    end
  end
end
