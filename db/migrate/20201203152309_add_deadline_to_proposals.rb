class AddDeadlineToProposals < ActiveRecord::Migration[6.0]
  def change
    add_column :proposals, :deadline, :date
  end
end
