class RoomQueue < ApplicationRecord
  validates :room_id, presence: true, uniqueness: true
end
