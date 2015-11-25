class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :description
      t.integer :credit_numbers

      t.timestamps null: false
    end
  end
end
