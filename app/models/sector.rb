class Sector < ActiveRecord::Base
  validates_presence_of :short_name, :name, :description
  validates_length_of :short_name, maximum: 3
  has_many :areas

  #has_many_and_belongs_to_many
end
