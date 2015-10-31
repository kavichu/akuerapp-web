class CreateEstablecimientoProductos < ActiveRecord::Migration
  def change
    create_table :establecimiento_productos do |t|
      t.string :producto
      t.string :establecimiento
      t.string :disponible
      t.string :fecha
      t.string :periodicidad
      t.string :tipo_ingreso
      t.string :fecha_ultimo_movimiento
      t.string :fecha_distribucion

      t.timestamps null: false
    end
  end
end
