# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  username   :string(255)
#  bio        :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe(Profile, type: :model) do
  pending "add some examples to (or delete) #{__FILE__}"
end
