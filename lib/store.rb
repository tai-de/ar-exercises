=begin
  - Stores must always have a name that is a minimum of 3 characters
  - Stores have an annual_revenue that is a number (integer) that must be 0 or more
  - BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)
=end

class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :carries_valid_stock

  before_destroy :check_employee_count

  private

  def carries_valid_stock
    errors.add(:carries_valid_stock, "stores must carry 'mens_apparel' or 'womens_apparel' (boolean: T)") unless mens_apparel || womens_apparel
  end

  def check_employee_count
    employee_count = Store.find_by(id: self.id).employees.length
    if employee_count > 0
      errors.add("stores with employees cannot be destroyed")
      throw :abort
    end
  end
end
