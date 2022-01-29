class RemovePostsCounterFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :postsCounter, :integer
  end
end
