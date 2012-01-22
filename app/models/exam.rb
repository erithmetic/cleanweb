class Exam < ActiveRecord::Base
  has_many :test_takers
  has_many :students, :through => :test_takers
  has_one :winner, :class_name => :student

  attr_accessible :student_ids, :pencils_down_at
end
