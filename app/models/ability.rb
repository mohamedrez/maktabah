# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Track
    can :read, Course
    can :read, Step

    return if user.blank?
    can :update, UserProgress, user: user

    return unless user.admin?
    can :manage, Course
    can :manage, Step
    can :manage, UserProgress
  end
end
