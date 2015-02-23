class Course < ActiveRecord::Base

validates :day_night, presence: true

end
