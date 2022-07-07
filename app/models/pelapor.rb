class Pelapor < ApplicationRecord
  belongs_to :user
  has_many :kejadians
  has_many :penerimas
end
