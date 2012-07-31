class UserRecentForm < ActiveRecord::Base
  attr_accessible :controller, :user
  belongs_to :user
end
