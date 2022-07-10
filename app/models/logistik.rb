class Logistik < ApplicationRecord
  belongs_to :kejadian
  belongs_to :penerima
  belongs_to :petugas
  has_many :distribusis
end
