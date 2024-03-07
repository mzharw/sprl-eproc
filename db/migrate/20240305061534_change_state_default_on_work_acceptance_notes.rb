class ChangeStateDefaultOnWorkAcceptanceNotes < ActiveRecord::Migration[7.1]
  def change
    change_column_default :work_acceptance_notes, :state, 'DRAFT'
  end
end
