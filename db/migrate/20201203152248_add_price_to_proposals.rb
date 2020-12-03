class AddPriceToProposals < ActiveRecord::Migration[6.0]
  def change
    add_column :proposals, :price, :float
  end
end
