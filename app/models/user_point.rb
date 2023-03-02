class UserPoint < ApplicationRecord
  belongs_to :user
  belongs_to :scorable, polymorphic: true

  def self.score_me(current_user, scorable)
    user_point = UserPoint.find_or_create_by!(user: current_user, scorable: scorable)
    if !user_point.check?
      if scorable.stepable_type == "Lecture"
        user_point.update!(check?: true, point: 10)
      elsif scorable.stepable_type == "Quiz"
        user_point.update!(check?: true, point: 20)
      elsif scorable.instance_of?(Course)
        user_point.update!(check?: true, point: 150)
      end
    end
  end
end
