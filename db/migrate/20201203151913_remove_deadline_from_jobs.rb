class RemoveDeadlineFromJobs < ActiveRecord::Migration[6.0]
  def change
    remove_column :jobs, :deadline, :date
  end
end
