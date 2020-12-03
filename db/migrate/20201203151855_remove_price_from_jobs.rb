class RemovePriceFromJobs < ActiveRecord::Migration[6.0]
  def change
    remove_column :jobs, :price, :float
  end
end
