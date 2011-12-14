class Employee < ActiveRecord::Base
  validates :name, :presence => true
  
  belongs_to :department
  
  API_ATTRIBUTES = [:name, :job_title, :birthday, :salary, :image_url, :phone_number, :email]
  
  def birthday=(birthday) 
    case birthday
    when String
      self.birthday = Date.parse(birthday)
    else
      write_attribute(:birthday, birthday)
    end
  end
  
  def as_json(options = {})
    super(options.merge(:only => API_ATTRIBUTES))
  end
end
