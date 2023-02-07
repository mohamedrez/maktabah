class UserProgress < ApplicationRecord
  belongs_to :user
  belongs_to :progressable, polymorphic: true

  enum status: { started: 0, completed: 1 }
  after_update :user_course_progress_callback

  def user_course_progress_callback

    return if status != 'completed' || progressable_type != 'Step'

    course_id = Step.find(progressable_id).course_id
    step_ids = Step.where(course_id:).pluck(:id)
    user_progresses = UserProgress.where(
      user_id:,
      progressable_type: 'Step',
      progressable_id: step_ids,
      status: :completed
    )
    return if user_progresses.count != step_ids.count

    usp = UserProgress.first_or_create!(
      user_id:,
      progressable_type: 'Course',
      progressable_id: course_id
    )
    # debugger
    # up.update_attribute('status', :completed)
  end
end
