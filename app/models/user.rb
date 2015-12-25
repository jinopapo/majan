class User < ActiveRecord::Base
  has_one :score
  accepts_nested_attributes_for :score
  validates :name,  presence: true ,length: { maximum: 50 }, uniqueness: true
end
