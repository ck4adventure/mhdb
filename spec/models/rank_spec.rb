# == Schema Information
#
# Table name: ranks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ranks_on_title  (title) UNIQUE
#
require 'rails_helper'

RSpec.describe Rank, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
