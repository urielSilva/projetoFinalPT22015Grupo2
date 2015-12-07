class CreateKnowledgeRequests < ActiveRecord::Migration
  def change
    create_table :knowledge_requests do |t|
      t.references :knowledge, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
