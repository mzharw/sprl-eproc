module Trackable
  extend ActiveSupport::Concern

  included do
    belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
    belongs_to :updater, class_name: 'User', foreign_key: 'updated_by'

    before_create :assign_created_by
    before_update :assign_updated_by

    validates :creator, presence: true
    validates :updater, presence: true, on: :update

    private

    def assign_created_by
      assign_user(:created_by)
    end

    def assign_updated_by
      assign_user(:updated_by)
    end

    def assign_user(attr)
      return unless respond_to?(:current_user)

      send("#{attr}=", current_user.id)
    end
  end
end
