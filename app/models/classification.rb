class Classification < ActiveRecord::Base
  attr_accessible :category_id, :word_id
  belongs_to :word
  belongs_to :category
end
