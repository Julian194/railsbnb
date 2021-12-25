# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  listing_id :integer          not null
#  room_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Room < ApplicationRecord
  belongs_to :listing
  has_many :beds, dependent: :destroy
  accepts_nested_attributes_for :beds #can later refernce as beds_attributes (setter)

  enum room_type: {
    bedroom: 0,
    primary_bedroom: 1,
    living_room: 2,
    basement: 3
  }
end
