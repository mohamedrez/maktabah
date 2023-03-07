# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Course

    return if user.blank?

    return unless user.admin?
    can :manage, Course
  end
end
