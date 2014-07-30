class Kitten < ActiveRecord::Base
  has_many :categorizations

  validates :image, presence: true

end
