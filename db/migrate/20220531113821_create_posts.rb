class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    # create_table :posts, id:false do |t| # id column is not created
    # ----
    #create_table :posts, primary_key :idNo do |t| # change primary key to idNo
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
