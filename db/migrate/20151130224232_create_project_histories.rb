class CreateProjectHistories < ActiveRecord::Migration
  def change
    create_table :project_histories do |t|
      t.text :observation
      t.references :project, index: true, foreign_key: true
      t.references :project_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
