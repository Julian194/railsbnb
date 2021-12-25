# == Schema Information
#
# Table name: beds
#
#  id         :integer          not null, primary key
#  room_id    :integer          not null
#  bed_size   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bed < ApplicationRecord
  belongs_to :room
  enum bed_size: {
    twin: 0,
    twin_xl: 1,
    full: 2,
    queen: 3,
    king: 4,
    california_king: 5
  }
end
