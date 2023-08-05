class AddUserNameToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :user_name, :string
  end
end
