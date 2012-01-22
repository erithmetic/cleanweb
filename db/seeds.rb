# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

gates = Student.create :name => 'Bill Gates', :email => 'bill@gates.com', :celebrity => true, :password => 'testtest', :password_confirmation => 'testtest'
gates.addresses.create :street => '1835 73rd Ave NE', :city => 'Medina', :state => 'WA', :zip => 98039,
  :gpa => 3.0

mckibben = Student.create :name => 'Bill McKibben', :email => 'bill@middlebury.edu', :celebrity => true, :password => 'testtest', :password_confirmation => 'testtest'
mckibben.addresses.create :street => '123 Main St', :city => 'Middlebury', :state => 'VT', :zip => 05753,
  :gpa => 4.0

dick = Student.create :name => 'Dick Cheney', :email => 'dick@haliburton.com', :celebrity => true, :password => 'testtest', :password_confirmation => 'testtest'
dick.addresses.create :street => '123 Chain Bridge Rd', :city => 'McLean', :state => 'VA', :zip => 98039,
  :gpa => 2.0
dick.addresses.create :street => '123 Main St', :city => 'Jackson', :state => 'WY', :zip => 98039,
  :gpa => 1.0

derek = Student.create :name => 'Derek Kastner', :email => 'dkastner@gmail.com', :password => 'testtest', :password_confirmation => 'testtest'
derek.addresses.create :street => '616 Westmoreland Ave', :city => 'Lansing', :state => 'MI', :zip => 48915
