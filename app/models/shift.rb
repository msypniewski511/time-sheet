class Shift < ActiveRecord::Base
    has_many :employees
    has_many :grafiks, dependent: :destroy
    validates_presence_of :nazwa, :message => "Musisz podać nazwę zmiany."
end
