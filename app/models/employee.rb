class Employee < ActiveRecord::Base
    validates_presence_of :email
    validates_uniqueness_of :email
    validates_length_of :email, :within => 5..50
    validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\Z/i
    
    validates_presence_of :password
    validates_presence_of :shift_id
    validates_presence_of :status_id
    validates_presence_of :department_id
    
    belongs_to :shift

end
