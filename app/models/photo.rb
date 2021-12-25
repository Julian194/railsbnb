# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  listing_id :integer          not null
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
  belongs_to :listing
  has_one_attached :photo
end
