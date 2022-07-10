class Pelapor < ApplicationRecord
  belongs_to :user
  has_many :kejadians
  has_many :penerimas
  
  accepts_nested_attributes_for :kejadians, allow_destroy: true
end
