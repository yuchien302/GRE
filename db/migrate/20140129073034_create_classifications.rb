class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.integer :word_id
      t.integer :category_id

      t.timestamps
    end
  end
end
