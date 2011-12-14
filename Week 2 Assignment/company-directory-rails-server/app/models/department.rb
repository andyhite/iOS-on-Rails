class Department < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :employees
  
  def as_json(options={})
    super(options.merge({ 
      :only => [:name], 
      :include => { 
        :employees => { :only => Employee::API_ATTRIBUTES }
      }
    }))
  end
end
