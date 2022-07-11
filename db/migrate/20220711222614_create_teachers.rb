class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :student_count
      t.integer :max_students
      t.boolean :enrollment_full
      t.boolean :daycare_id

      t.timestamps
    end
  end
end
