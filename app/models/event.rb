load 'image_uploader.rb'

class Event < ApplicationRecord
  include Activable
  belongs_to :chapter
  has_many :event_monsters, dependent: :destroy
  has_many :monsters, through: :event_monsters

  has_many :turns

  has_many :rewards, dependent: :destroy
  has_many :stuffs, through: :rewards

  has_many :messages

  delegate :world, :to => :chapter

  mount_uploader :image, EventImageUploader

  def grouped_monsters
    self.event_monsters.group_by{|m| m.monster_id}
  end

  def current_turn
    self.turns.where(finished: 0).first
  end

  def pass_turn(turn)
    turn.finish!
    self.world.characters.find_all.map{ |c| c.has_not_played! }
    self.world.current_event.event_monsters.find_all.map{ |em| em.has_not_played! }
  end
end
