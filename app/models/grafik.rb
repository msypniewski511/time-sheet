class Grafik < ActiveRecord::Base
    validates_presence_of :nazwa, :message => "Musisz podać nazwę grafiku."
    validates_presence_of :dane, :message => "Musisz podać dene."
end
