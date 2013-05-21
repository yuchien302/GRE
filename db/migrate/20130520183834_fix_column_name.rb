class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :words, :word, :title
  end

  def down
  end
end
