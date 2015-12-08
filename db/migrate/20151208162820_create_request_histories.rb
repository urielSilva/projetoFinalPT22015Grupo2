class CreateRequestHistories < ActiveRecord::Migration
  def change
    create_table :request_histories do |t|
      t.boolean :deferido
      t.string :observation
      t.references :knowledge_request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
