class Highlight < ApplicationRecord
  validates :title, uniqueness: true
end
