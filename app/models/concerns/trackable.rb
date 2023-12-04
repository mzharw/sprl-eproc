module Trackable
  extend ActiveSupport::Concern

  included do
    belongs_to :creator, class_name: 'User', foreign_key: 'created_by', optional: true
    belongs_to :updater, class_name: 'User', foreign_key: 'updated_by', optional: true

    before_create :set_created_by
    before_update :set_updated_by
  end

  private

  def set_created_by
    set_user_id(:created_by)
  end

  def set_updated_by
    set_user_id(:updated_by)
  end

  def set_user_id(attribute)
    self.send("#{attribute}=", current_user.id) if respond_to?(:current_user)
  end
end