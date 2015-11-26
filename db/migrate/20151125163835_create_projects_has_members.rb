class CreateProjectsHasMembers < ActiveRecord::Migration
  def change
    create_table :projects_has_members do |t|
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
