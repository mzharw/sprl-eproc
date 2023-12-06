module UserTrackable
  extend ActiveSupport::Concern

  private

  def tracker(*options)
    action = {}

    action[:created_by] = current_user.id if options.empty? || options.include?('create')
    action[:updated_by] = current_user.id if options.empty? || options.include?('update')

    action
  end
end
