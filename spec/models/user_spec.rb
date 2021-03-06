# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  login      :string           not null
#  email      :string           not null
#  fname      :string
#  lname      :string
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe User do
  it 'should create' do
    user = User.new
    user.login = "user1"
    user.email = "user@example.com"
    user.fname = "jon"
    user.lname = "doe"
    user.password = "password"
    expect(user.save).to be_truthy
  end

  it 'should validate login' do
    user = User.new
    user.email = "user@example.com"
    user.fname = "jon"
    user.lname = "doe"
    user.password = "password"
    expect(user.save).to be_falsey
  end

  it 'should validate email' do
    user = User.new
    user.login = "user1"
    user.fname = "jon"
    user.lname = "doe"
    user.password = "password"
    expect(user.save).to be_falsey
  end

  it 'should validate password' do
    user = User.new
    user.login = "user1"
    user.email = "user@example.com"
    user.fname = "jon"
    user.lname = "doe"
    expect(user.save).to be_falsey
  end

  describe '.password' do
    let(:user) {create(:user)}
    it {expect(user.password).to eq('password')}
  end
end
