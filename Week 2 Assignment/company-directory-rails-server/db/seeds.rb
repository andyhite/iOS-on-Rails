@department = Department.create(:name => "Test Department")
Employee.create(:name => "Test Employee", :job_title => "Foobar", :birthday => Date.today, :salary => 100000, :department => @department)