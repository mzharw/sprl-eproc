module UserTrackable
  extend ActiveSupport::Concern

  private

  def tracker(*options)
    action = {}

    action[:created_by_id] = current_user.id if options.empty? || options.include?(:create)
    action[:updated_by_id] = current_user.id if options.empty? || options.include?(:update)

    action
  end

  def set_tracker(collection, *column, **options)
    collection = set_scope(collection, *column)
    collection = collection&.where(id: params[:id])&.first

    if collection.nil?
      flash.alert = 'Item not found. Please try again later'
      redirect_to options[:redirect_path] || root_path
    end

    collection

  end

  def set_scope(collection, *column)
    unless !column.empty? && current_user.is_superuser? || current_user.is_buyer? || current_user.is_finance_manager? || current_user.is_hse?
      # collection = collection.where(plant_id: current_user.plant_ids) if column.include? :plants
      collection = collection.where(purch_group_id: current_user.purch_group_ids) if column.include? :purch_groups
    end

    collection
  end
end
