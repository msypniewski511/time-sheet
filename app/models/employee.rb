class Employee < ActiveRecord::Base
    validates_presence_of :email, :message => "nie może być pusty."
    validates_uniqueness_of :email, :message => "jest już zajęty."
    validates_length_of :email, :within => 5..50, :message => "musi zawierać się w przedziale od 5 do 50 znaków."
    validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\Z/i, :message => "nie jest adresem e-mail."
    
    validates_presence_of :password, :message => "nie może być puste."
    validates_length_of :password, :within => 5..20, :message => "musi mieć co najmniej 5 a najwięcej 20 znaków."
    validates_confirmation_of :password
    
    validates_presence_of :shift_id
    validates_presence_of :status_id
    validates_presence_of :department_id
    
    belongs_to :shift
    belongs_to :department
    belongs_to :status

end
