class AddCommentToSavings < ActiveRecord::Migration[6.1]
  def change
    add_column :savings, :comment, :string
  end
end
