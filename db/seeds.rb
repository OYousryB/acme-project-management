puts 'Start Seeding Some Dummy Employees'

NUM_REQUESTS = 20
if Employee.count.zero?
  1.upto(NUM_REQUESTS) do |i|
    employee = Employee.new
    employee.first_name = Faker::Name.first_name
    employee.last_name = Faker::Name.middle_name
    employee.role = Employee.roles.keys.sample
    employee.department = Employee.departments.keys.sample
    employee.email = "employee_#{i}_@mailinator.com"

    employee.save
  end
end
