class AddDepartmentIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :department_id, :integer
    add_index :employees, :department_id
  end
end
