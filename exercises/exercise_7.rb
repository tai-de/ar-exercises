require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

=begin
1. Add validations to two models to enforce the following business rules:
  - Employees must always have a first name present
  - Employees must always have a last name present
  - Employees have a hourly_rate that is a number (integer) between 40 and 200
  - Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
  - Stores must always have a name that is a minimum of 3 characters
  - Stores have an annual_revenue that is a number (integer) that must be 0 or more
  - BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)
2. Ask the user for a store name (store it in a variable)
3. Attempt to create a store with the inputted name but leave out the other fields (annual_revenue, mens_apparel, and womens_apparel)
4. Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to save/create the record
=end

#@store1.employees.create!(first_name: "Cheap", last_name: "Labour", hourly_rate: 30)   # => Will not be created due to hourly_rate not meeting requirement (40 < rate < 200)
#@store1.employees.create!(first_name: "Over", last_name: "Paid", hourly_rate: 250)   # => Will not be created due to hourly_rate not meeting requirement (40 < rate < 200)

Store.create!(name: "Calgary", annual_revenue: 300000, mens_apparel: true)

puts "Submit a store name: "
print "> "

@store_name = gets.chomp.to_s

@store8 = Store.create(name: @store_name)

if @store8.errors.messages
  @store8.errors.messages.each do |error_key, message|
    puts "ERROR: #{error_key} #{message.first}"
  end
end
