# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  ask        :text(65535)
#  quiz_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe(Question, type: :model) do
  pending "add some examples to (or delete) #{__FILE__}"
end
