# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'properties and validations' do
    subject { build(:category) }
    it { should have_db_column(:name) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should have_db_index(:name) }
  end
end
