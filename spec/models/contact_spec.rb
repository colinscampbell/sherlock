# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  text        :text
#  scenario_id :integer          not null
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

describe Contact do
end
