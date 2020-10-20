# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  email         :string           not null
#  pw_hash       :string           not null
#  session_token :string           not null
#  username      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rank_id       :integer          default(1), not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_session_token  (session_token) UNIQUE
#  index_users_on_username       (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do  
  describe 'model properties' do
    context 'it has a required name and email' do
      let(:user) { build(:user) }
      it 'is valid when given valid information' do
        expect(user.valid?).to be true
      end
    end
  end 

  describe 'model shouldas' do
    subject { build(:user) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_presence_of(:pw_hash) }
  end

  describe 'association shouldas' do
    subject { build(:user) }
    it { should belong_to(:rank) }
    it { should have_many(:locations).through(:rank) }
  end

  describe 'model methods' do
    describe '#ensure_session_token' do
      let(:user) { User.new(username: "Larry", email: "test@test.com", rank_id: 1) }
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
      it 'creates a new session token, saves it to user, and returns it'
    end

    describe '#ensure_default_rank' do
      it 'retrieves the rank if one exists' do
        user = User.new(username: "Larry", email: "test@test.com", rank_id: 2)
        expect(user.rank_id).to eq 2
      end
      it 'sets a default rank of 1 if none given' do
        u2 = User.new(username: "Larry", email: "test@test.com")
        expect(u2.rank_id).to eq 1
      end
    end
  end
end
