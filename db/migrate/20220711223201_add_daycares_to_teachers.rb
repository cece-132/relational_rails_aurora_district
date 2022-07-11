class AddDaycaresToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_reference :teachers, :daycare, foreign_key: true
  end
end
