class Logistik < ApplicationRecord
  belongs_to :kejadian
  belongs_to :penerima
  belongs_to :petugas
  has_many :distribusis

  accepts_nested_attributes_for :distribusis, allow_destroy: true
end
