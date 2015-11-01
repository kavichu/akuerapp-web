class DisponibleSerializer < ActiveModel::Serializer
  # attributes :id, :disponible, :fecha, :periodicidad, :tipo_ingreso, :fecha_ultimo_movimiento, :fecha_distribucion
  attributes :producto_id, :disponible, :tipo_ingreso, :fecha_ultimo_movimiento
end
