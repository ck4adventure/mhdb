# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  email         :string           not null
#  name          :string           not null
#  session_token :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rank_id       :integer          default(1), not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_session_token  (session_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @rank = Rank.create!(title: "Test me once")
    @rank2 = Rank.create!(title: "Test me twice")
  end
  
  describe 'model properties' do
    context 'it has a required name and email' do
      let(:user) { User.new(name: "Larry", email: "testy", rank_id: 1) }
      it 'is valid when given valid information' do
        expect(user.valid?).to be true
      end

      it 'is not valid when no name is given' do
        user.name = ""
        expect(user.valid?).to be false
      end
      
      it 'is not valid when a duplicate email is given' do
        user.save!
        u2 = User.new(name: "Copycat", email: user.email)
        expect(u2.valid?).to be false
      end
    end

    describe 'it has a rank_id' do
      it 'sets a default rank if none given'
    end
  end 

  describe 'a User has a session_token at all time' do
    let(:user) { User.new(name: "Larry", email: "test@test.com") }
    it 'is valid when a session_token is present' do
      expect(user.valid?).to be true
    end
    it 'is invalid if no session_token is present' do
      user.session_token = nil
      expect(user.valid?).to be false
    end
  end

  describe 'model methods' do
    describe '#ensure_session_token' do
      let(:user) { User.new(name: "Larry", email: "test@test.com", rank_id: 1) }
      it 'retrieves a session_token if one already exists' do
        new_token = "12345678910"
        user.session_token = new_token
        expect(user.ensure_session_token).to eq(new_token)
      end
      it 'creates a new session_token if none exists' do
        u2 = User.new()
        expect(u2.session_token).to be
      end
    end

    describe '#reset_session_token' do
      it 'creates a new session token'
      it 'saves it to the user'
      it 'returns the value'
    end

    describe '#ensure_default_rank' do
      
      it 'retrieves the rank if one exists' do
        user = User.new(name: "Larry", email: "test@test.com", rank_id: 2)
        expect(user.rank_id).to eq 2
      end
      it 'sets a default rank of 1 if none given' do
        u2 = User.new(name: "Larry", email: "test@test.com")
        expect(u2.rank_id).to eq 1
      end
    end
  end
end
