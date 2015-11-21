class AddSectorToUser < ActiveRecord::Migration
  def change
    add_reference :users, :sector, index: true, foreign_key: true
  end
end
