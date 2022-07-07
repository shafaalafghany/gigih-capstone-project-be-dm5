class Kejadian < ApplicationRecord
  belongs_to :pelapor
  has_many :poskos
  has_many :kerusakans
  has_many :penanggulangans
  has_many :logistiks
end
