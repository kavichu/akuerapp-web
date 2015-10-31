class CreateDistritos < ActiveRecord::Migration
  def change
    create_table :distritos do |t|
      t.belongs_to :region, index: true

      t.string :region
      t.string :nombre

      t.timestamps null: false
    end
  end
end
