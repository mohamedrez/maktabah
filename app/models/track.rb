# frozen_string_literal: true

# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Track < ApplicationRecord
  has_rich_text :description
  has_many :courses, -> { order(position: :asc) }, inverse_of: :track, dependent: :destroy

  delegate :count, to: :courses, prefix: true
end
