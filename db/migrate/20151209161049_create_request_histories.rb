class CreateRequestHistories < ActiveRecord::Migration
  def change
    create_table :request_histories do |t|
      t.references :request_status, index: true, foreign_key: true
      t.references :knowledge_request, index: true, foreign_key: true
      t.text :observation

      t.timestamps null: false
    end
  end
end
