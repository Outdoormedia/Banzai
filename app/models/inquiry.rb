class Inquiry < ActiveRecord::Base
  attr_accessible :address, :email, :interest, :name, :phone, :title
end
