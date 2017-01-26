class ClimbApp < ActiveRecord::Base
  belongs_to  :user
  belongs_to :climb
end
