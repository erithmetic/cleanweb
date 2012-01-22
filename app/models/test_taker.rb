class TestTaker < ActiveRecord::Base
  belongs_to :student
  belongs_to :exam

  def self.celebrities
    Student.celebrities.map do |student|
      new :student => student
    end
  end
end
