class CreateProjectRoles < ActiveRecord::Migration
  def change
    create_table :project_roles do |t|
      t.string :role

      t.timestamps null: false
    end
  end
end
