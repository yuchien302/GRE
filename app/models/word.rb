class Word < ActiveRecord::Base
  attr_accessible :antonyms, :compare, :note, :root, :root_derive, :sen, :synonyms, :tips, :word
end
