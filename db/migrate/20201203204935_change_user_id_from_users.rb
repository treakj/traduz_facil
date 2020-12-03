class ChangeUserIdFromUsers < ActiveRecord::Migration[6.0]
  change_column :proposals, :user_id, :bigint, null: true
end
