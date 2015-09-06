class Score < ActiveRecord::Base
  belongs_to :hand
  belongs_to :user
  accepts_nested_attributes_for :hand
  accepts_nested_attributes_for :user
end
