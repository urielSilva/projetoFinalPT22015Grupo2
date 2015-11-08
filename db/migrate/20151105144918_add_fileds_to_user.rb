class AddFiledsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_reference :users, :profile, index: true, foreign_key: true
    add_reference :users, :job, index: true, foreign_key: true
  end
end
