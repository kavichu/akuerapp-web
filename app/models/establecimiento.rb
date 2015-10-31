class Establecimiento < ActiveRecord::Base
  belongs_to :distrito
  has_many :disponibles
  has_many :productos, through: :disponibles
end
