# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'a User has a name and a unique email' do
    let(:user) { User.new(name: "Larry", email: "test@test.com") }
    it 'is valid when given valid information' do
      expect(user.valid?).to be true
    end

    it 'is not valid when no name is given' do
      user.name = ""
      expect(user.valid?).to be false
    end

    it 'is not valid when a duplicate email is given' do
      pending
      user.save!
      u2 = User.new(name: "Copycat", email: user.email)
      expect(u2.valid?).to be false
    end
  end 
end
