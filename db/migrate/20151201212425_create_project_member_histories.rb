class CreateProjectMemberHistories < ActiveRecord::Migration
  def change
    create_table :project_member_histories do |t|
      t.text :observation
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :project_role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
