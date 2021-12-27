# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  request_body  :text
#  status        :integer          default("0")
#  error_message :text
#  source        :string
#  event_type    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Event < ApplicationRecord
  enum status: {pending: 0, processed: 1, failed: 2}

end
