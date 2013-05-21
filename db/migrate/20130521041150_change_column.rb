class ChangeColumn < ActiveRecord::Migration
  def up
  	change_column :words, :meaning, :text
  	change_column :words, :root, :text
  end

  def down
  end
end
