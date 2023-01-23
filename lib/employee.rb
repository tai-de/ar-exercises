=begin
  - Employees must always have a first name present
  - Employees must always have a last name present
  - Employees have a hourly_rate that is a number (integer) between 40 and 200
  - Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
=end

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true

  after_create :generate_password

  private

  def generate_password
    o = [(0...9), ('a'...'z'), ('A'...'Z')].map(&:to_a).flatten
    self.password = (0...8).map { o[rand(o.length)] }.join
    self.save
  end
end
