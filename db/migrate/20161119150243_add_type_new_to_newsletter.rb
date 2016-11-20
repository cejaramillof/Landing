class AddTypeNewToNewsletter < ActiveRecord::Migration
  def change
    add_column :newsletters, :type_new, :string
  end
end