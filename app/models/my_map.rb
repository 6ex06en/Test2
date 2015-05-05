class MyMap < ActiveRecord::Base
  attr_accessible :title
  has_many :markers, dependent: :destroy
  validates :title, presence: true
end
