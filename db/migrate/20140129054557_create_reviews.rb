class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :state
	  t.integer :word_id
      t.timestamps
    end
  end
end
