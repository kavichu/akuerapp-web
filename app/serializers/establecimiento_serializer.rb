class EstablecimientoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :tipo, :direccion, :telefono, :responsable, :depende_de, :estado, :latitud, :longitud, :codigo, :internet, :codigo_saa, :fecha_activo, :fecha_inactivo
end
