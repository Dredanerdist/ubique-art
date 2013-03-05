class CreateUsersPaintingsLikeJoinTable < ActiveRecord::Migration
  def change
    create_table :painting_likes, :id => false do |t|
      t.integer :user_id
      t.integer :painting_id
    end
  end
end
