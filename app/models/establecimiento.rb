class Establecimiento < ActiveRecord::Base
  belongs_to :distrito
  has_many :disponibles
  has_many :productos, through: :disponibles

  scope :close_to, -> (latitude, longitude, distance_in_meters = 2000) {
    where(%{
      ST_DWithin(
        ST_GeographyFromText(
          'SRID=4326;POINT(' || establecimientos.longitud || ' ' || establecimientos.latitud || ')'
        ),
        ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
        %d
      )
    } % [longitude, latitude, distance_in_meters])
  }
end
