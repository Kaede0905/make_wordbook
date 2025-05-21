class Word < ApplicationRecord
  validates :english, presence: true
  validates :japanese, presence: true
end
