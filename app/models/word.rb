class Word < ActiveRecord::Base
  attr_accessible :title, :meaning, :sen, :tips, :root, :note, :root_derive, :synonyms, :antonyms, :compare
  validates_uniqueness_of :title
  validates_presence_of :title
end
