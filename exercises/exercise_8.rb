require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 8"
puts "----------"

=begin
1. Set up file
2. Modify schema (added password::string to employees table)
=end

@store5 = Store.find_by(id: 5)
@harry_potter = @store5.employees.create!(first_name: "Harry", last_name: "Potter", hourly_rate: 77)

print "Harry Potter's password: "
puts @harry_potter.password