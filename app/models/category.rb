class Category < ActiveRecord::Base
  attr_accessible :title, :state
  has_many :classifications
  has_many :words, through: :classifications
end
