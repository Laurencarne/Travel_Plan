class Review < ApplicationRecord
  belongs_to :activity

  def self.sort_highest
    ratings = self.all.sort_by{|review| review.rating}.reverse
    ratings[0 ... 10]
  end
end
