class ChangeProposalsTableStatusColumnDefault2 < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:proposals, :status, 'pending')
  end
end
