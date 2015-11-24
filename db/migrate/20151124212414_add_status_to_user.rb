class AddStatusToUser < ActiveRecord::Migration
  def change
    add_reference :users, :user_status, index: true, foreign_key: true
  end
end