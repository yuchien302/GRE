class AddStateToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :state, :string, default: "reviewAll"
  end
end
