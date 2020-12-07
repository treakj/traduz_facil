class ChangeProposalsTableStatusColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:proposals, :status, 'Pending')
  end
end
