class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity_description
      t.integer :activity_credit_number

      t.timestamps null: false
    end
  end
end
