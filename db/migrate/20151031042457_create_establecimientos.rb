class CreateEstablecimientos < ActiveRecord::Migration
  def change
    create_table :establecimientos do |t|
      t.string :nombre
      t.string :tipo
      t.string :mapa

      t.timestamps null: false
    end
  end
end
