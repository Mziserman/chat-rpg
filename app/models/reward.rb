class Reward < ApplicationRecord
  include Attributable
  include Sluggable
  belongs_to :stuff
  belongs_to :event

  delegate :world, :to => :stuff
end
