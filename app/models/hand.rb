class Hand < ActiveRecord::Base
  has_many :scores
  accepts_nested_attributes_for :scores
end
