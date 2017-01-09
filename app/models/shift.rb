class Shift < ActiveRecord::Base
    has_many :employees
    validates_presence_of :nazwa, :message => "Musisz podać nazwę zmiany."
end
