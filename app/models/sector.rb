class Sector < ActiveRecord::Base
  validates_presence_of :short_name, :name, :description
end
