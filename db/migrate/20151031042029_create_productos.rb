class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :tipo
      t.string :codigo_dncp
      t.string :estado
      t.string :codigo
      t.string :mapa
      t.string :clasificador
      t.string :subclasificador
      t.string :concentracion
      t.string :forma_parmaceutica
      t.string :presentacion
      t.string :codigo_grupo_farmacologico
      t.string :nombre_grupo_farmacologico
      t.string :codigo_subgrupo_farmacologico
      t.string :nombre_subgrupo_farmacologico
      t.string :tipo_adquisicion

      t.timestamps null: false
    end
  end
end
