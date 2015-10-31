class CreateDisponibles < ActiveRecord::Migration
  def change
    create_table :disponibles do |t|
      t.belongs_to :producto, index: true
      t.belongs_to :establecimiento, index: true

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
