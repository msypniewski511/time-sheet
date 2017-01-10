class Grafik < ActiveRecord::Base
    has_one :shift
    validates_presence_of :nazwa, :message => "Musisz podać nazwę grafiku."
    validates_presence_of :dane, :message => "Musisz podać dene."
end
