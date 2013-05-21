class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :title
      t.text :meaning
      t.text :sen
      t.text :tips
      t.text :compare
      t.text :synonyms
      t.text :antonyms
      t.text :root
      t.text :root_derive
      t.text :note

      t.timestamps
    end
  end
end
