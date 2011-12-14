class Department < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :employees
  
  API_ATTRIBUTES = [:name]
  API_ASSOCIATIONS = { 
    :employees => { :only => Employee::API_ATTRIBUTES }
  }
  
  def as_json(options={})
    super(options.merge(:only => API_ATTRIBUTES, :include => API_ASSOCIATIONS))
  end
end
