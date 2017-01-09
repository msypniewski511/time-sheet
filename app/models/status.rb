class Status < ActiveRecord::Base
    validates_presence_of :nazwa, :message => "Musisz podać nazwę stanowiska."
    validates_presence_of :uprawnienia, :message => "Musisz podać uprawnienia."
end
