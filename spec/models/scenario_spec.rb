# == Schema Information
#
# Table name: scenarios
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  solution    :text
#  universe_id :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

describe Scenario do
end
