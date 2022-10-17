class Hotspot < ApplicationRecord
  has_many :birds

  def self.newest_first
    Hotspot.order(created_at: :desc)
  end

  def bird_count
    birds.count
  end
end