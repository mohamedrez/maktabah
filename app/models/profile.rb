# frozen_string_literal: true

class Profile < ApplicationRecord
  has_and_belongs_to_many :courses
end
