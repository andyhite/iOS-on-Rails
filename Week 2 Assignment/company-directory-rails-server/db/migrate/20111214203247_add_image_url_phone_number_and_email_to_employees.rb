class AddImageUrlPhoneNumberAndEmailToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :image_url, :string
    add_column :employees, :phone_number, :string
    add_column :employees, :email, :string
  end
end
