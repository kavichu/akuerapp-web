class Producto < ActiveRecord::Base
  has_many :disponibles
  has_many :establecimientos, through: :disponibles
end
