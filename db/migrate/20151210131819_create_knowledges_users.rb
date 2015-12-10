class CreateKnowledgesUsers < ActiveRecord::Migration
  def change
    create_table :knowledges_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :knowledge, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
