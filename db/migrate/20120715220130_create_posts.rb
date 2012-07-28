class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.text :body
    	t.integer :votes
    	t.integer :flagged
      	t.timestamps
    end
  end
end
