class Department < ActiveRecord::Base
    validates_presence_of :nazwa, :message => "Musisz podać nazwę działu."
    has_many :employees
end
