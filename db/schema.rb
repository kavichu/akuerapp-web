# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151031042514) do

  create_table "distritos", force: :cascade do |t|
    t.string   "region"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "establecimiento_productos", force: :cascade do |t|
    t.string   "producto"
    t.string   "establecimiento"
    t.string   "disponible"
    t.string   "fecha"
    t.string   "periodicidad"
    t.string   "tipo_ingreso"
    t.string   "fecha_ultimo_movimiento"
    t.string   "fecha_distribucion"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "establecimientos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "tipo"
    t.string   "mapa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "tipo"
    t.string   "codigo_dncp"
    t.string   "estado"
    t.string   "codigo"
    t.string   "mapa"
    t.string   "clasificador"
    t.string   "subclasificador"
    t.string   "concentracion"
    t.string   "forma_parmaceutica"
    t.string   "presentacion"
    t.string   "codigo_grupo_farmacologico"
    t.string   "nombre_grupo_farmacologico"
    t.string   "codigo_subgrupo_farmacologico"
    t.string   "nombre_subgrupo_farmacologico"
    t.string   "tipo_adquisicion"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
