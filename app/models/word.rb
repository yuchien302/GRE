class Word < ActiveRecord::Base
  attr_accessible :title, :meaning, :sen, :tips, :root, :note, :root_derive, :synonyms, :antonyms, :compare
  validates_uniqueness_of :title
  validates_presence_of :title
  has_many :reviews
  has_many :classifications
  has_many :categories, through: :classifications


end
