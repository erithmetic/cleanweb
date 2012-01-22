class Address < ActiveRecord::Base
  belongs_to :student
  has_many :readings
end
