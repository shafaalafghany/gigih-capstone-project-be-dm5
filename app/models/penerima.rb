class Penerima < ApplicationRecord
  belongs_to :pelapor
  has_many :logistiks
end
