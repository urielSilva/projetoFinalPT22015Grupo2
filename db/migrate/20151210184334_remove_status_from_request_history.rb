class RemoveStatusFromRequestHistory < ActiveRecord::Migration
  def change
    remove_reference :request_histories, :request_status, index: true, foreign_key: true
  end
end
