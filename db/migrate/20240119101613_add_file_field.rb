class AddFileField < ActiveRecord::Migration[6.1]
  def change
    add_column :friends, :file, :string
  end
end
