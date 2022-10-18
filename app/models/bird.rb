class Bird < ApplicationRecord
  belongs_to :hotspot

  def self.show_raptor
    Bird.where("raptor = true")
  end
end