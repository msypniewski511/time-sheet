class Shift < ActiveRecord::Base
    has_many :employees
    has_one :grafik
    validates_presence_of :nazwa, :message => "Musisz podać nazwę zmiany."
end
