class AddLookToComments < ActiveRecord::Migration
  def change
    add_column :comments, :look, :string
  end
end
