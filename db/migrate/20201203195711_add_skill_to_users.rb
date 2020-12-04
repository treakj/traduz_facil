class AddSkillToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :skill, :text
  end
end
