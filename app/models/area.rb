class Area < ActiveRecord::Base

  validates_presence_of :name

  belongs_to :sector
  has_many :users

end
