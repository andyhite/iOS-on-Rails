class DepartmentsController < ApplicationController

  respond_to :json
  
  def index
    @departments = Department.all
    
    respond_with({ :departments => @departments })
  end
end
