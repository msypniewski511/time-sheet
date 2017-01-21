class OptionShift < ActiveRecord::Base
  validates :option, :color, :description, presence: :true
end
