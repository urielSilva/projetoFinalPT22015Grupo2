class CreateKnowledgeLevels < ActiveRecord::Migration
  def change
    create_table :knowledge_levels do |t|
      t.string :level
      t.string :description

      t.timestamps null: false
    end
  end
end
