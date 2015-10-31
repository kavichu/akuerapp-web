class CreateEstablecimientos < ActiveRecord::Migration
  def change
    create_table :establecimientos do |t|
      t.string :nombre
      t.string :tipo
      t.string :direccion
      t.string :telefono
      t.string :responsable
      t.string :depende_de
      t.string :estado
      t.float :latitud
      t.float :longitud
      t.string :codigo
      t.string :internet
      t.string :codigo_saa
      t.date :fecha_activo
      t.date :fecha_inactivo

      t.timestamps null: false
    end
  end
end
