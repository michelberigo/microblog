class CreateUserFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_followers do |t|
      t.integer :user_id
      t.integer :follower_user_id

      t.timestamps
    end
  end
end
