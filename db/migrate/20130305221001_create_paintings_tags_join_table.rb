class CreatePaintingsTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :paintings_tags, :id => false do |t|
      t.integer :painting_id
      t.integer :tag_id
    end
  end
end

