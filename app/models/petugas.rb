class Petugas < ApplicationRecord
  has_many :logistiks
  has_many :penanggulangans
  has_many :distribusis
end
