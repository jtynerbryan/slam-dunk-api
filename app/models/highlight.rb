class Highlight < ApplicationRecord

  validates :title, uniqeness: true
end
