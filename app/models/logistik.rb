class Logistik < ApplicationRecord
  belongs_to :kejadian
  belongs_to :penerima
  belongs_to :petuga
  has_many :logistiks
end
