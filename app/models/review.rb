class Review < ActiveRecord::Base
  attr_accessible :state, :word_id
  belongs_to :zombie
end
