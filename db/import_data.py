import csv
import sqlite3
import json

from datetime import datetime

# load the adapter
import psycopg2

# load the psycopg extras module
import psycopg2.extras

# Try to connect
try:
    connSQLite3 = sqlite3.connect('/home/luisvaldes/workspace/ruby-workspace/akuerapp_opendata.db')
    cursorSQLite3 = connSQLite3.cursor()

    conn_string = "host='localhost' dbname='akuerappdb' user='akuerappuser' password='asdf1234'"
    print ("Connecting to database\n ->%s" % (conn_string))
    connPostgreSQL = psycopg2.connect(conn_string)
    connPostgreSQL.set_isolation_level(psycopg2.extensions.ISOLATION_LEVEL_AUTOCOMMIT)
except Exception as e:
    print(e)
    print ("I am unable to connect to the database.")


if connPostgreSQL:
  cursorPostgreSQL = connPostgreSQL.cursor(cursor_factory=psycopg2.extras.DictCursor)

# Note that below we are accessing the row via the column name.

# Do this instead
path = "/home/luisvaldes/workspace/ruby-workspace/data-mspbs/{file}.{ext}"


def import_regiones():
  # field1 => nombreRegion
  # field2 => codigoRegion
# Rails
  # t.string   "nombre"
  result = cursorSQLite3.execute('select field1, field2 from establecimientos where field1 not like "nombre%" group by field1, field2 ')
  for row in result:
    if '' in row:
      continue

    data = {
      "id": int(row[1]),
      "nombre": row[0],
      "created_at": datetime.now(),
      "updated_at": datetime.now()
    }
    cursorPostgreSQL.execute("INSERT INTO regiones (id, nombre, created_at, updated_at) VALUES (%s, %s, %s, %s)", (data["id"], data["nombre"], data["created_at"], data["updated_at"]))

# import_regiones()

# def import_distritos():
#   # field2  => codigoRegion
#   # field3  => nombreDistrito
#   # field21 => codigoDistritoSaa

# # Rails 
# # t.integer  "region_id"
# # t.string   "region"
# # t.string   "nombre"

#   result = c.execute('select field2, field3, field21 from establecimientos where field3 not like "nombre%" group by field2, field3, field21 ')
#   for row in result:
#     print (row)

def import_productos():
# Rails Schema
  # t.string   "nombre"
  # t.string   "tipo"
  # t.string   "codigo_dncp"
  # t.string   "estado"
  # t.string   "codigo"
  # t.string   "mapa"
  # t.string   "clasificador"
  # t.string   "subclasificador"
  # t.string   "concentracion"
  # t.string   "forma_parmaceutica"
  # t.string   "presentacion"
  # t.string   "codigo_grupo_farmacologico"
  # t.string   "nombre_grupo_farmacologico"
  # t.string   "codigo_subgrupo_farmacologico"
  # t.string   "nombre_subgrupo_farmacologico"
  # t.string   "tipo_adquisicion"
  productos = path.format(file='productos', ext='json')
  result = json.loads(open(productos).read())
  for row in result:
    if '' in row:
      continue
    data = {
      "id": int(row["id"]),
      "nombre": row["nombre"],
      "tipo": row["tipoProducto"],
      "codigo_dncp": row["codigo"],
      "estado": row["estado"],
      "codigo": row["codigo"],
      "mapa": row["mapa"],
      "clasificador": row["clasificadorProducto"],
      "subclasificador": row["subclasificadorProducto"],
      "concentracion": row["concentracion"],
      "forma_parmaceutica": row["formaFarmaceutica"],
      "presentacion": row["presentacion"],
      "codigo_grupo_farmacologico": row["codigoGrupoFarmacologico"],
      "nombre_grupo_farmacologico": row["nombreGrupoFarmacologico"],
      "codigo_subgrupo_farmacologico": row["codigoSubgrupoFarmacologico"],
      "nombre_subgrupo_farmacologico": row["nombreSubgrupoFarmacologico"],
      "tipo_adquisicion": row["tipoAdquisicion"],
      "created_at": datetime.now(),
      "updated_at": datetime.now()
    }
    try:
      print(tuple(data.values()))
      statement = """INSERT INTO productos (id, 
                                            nombre, 
                                            tipo, 
                                            codigo_dncp, 
                                            codigo, 
                                            mapa, 
                                            clasificador,
                                            subclasificador,
                                            concentracion, 
                                            forma_parmaceutica,
                                            presentacion, 
                                            codigo_grupo_farmacologico, 
                                            nombre_grupo_farmacologico,
                                            codigo_subgrupo_farmacologico, 
                                            nombre_subgrupo_farmacologico,
                                            tipo_adquisicion, 
                                            created_at, 
                                            updated_at) 
                              VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, 
                                      %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
      
      cursorPostgreSQL.execute(statement, (
        data["id"], 
        data["nombre"], 
        data["tipo"], 
        data["codigo_dncp"], 
        data["codigo"], 
        data["mapa"], 
        data["clasificador"],
        data["subclasificador"],
        data["concentracion"], 
        data["forma_parmaceutica"],
        data["presentacion"], 
        data["codigo_grupo_farmacologico"], 
        data["nombre_grupo_farmacologico"],
        data["codigo_subgrupo_farmacologico"], 
        data["nombre_subgrupo_farmacologico"],
        data["tipo_adquisicion"], 
        data["created_at"], 
        data["updated_at"]
    ))
    except Exception as e:
      # print(data)
      print (e)

# import_productos()


def import_establecimientos():

# Rails
  # t.string   "nombre"
  # t.string   "tipo"
  # t.string   "direccion"
  # t.string   "telefono"
  # t.string   "responsable"
  # t.string   "depende_de"
  # t.string   "estado"
  # t.float    "latitud"
  # t.float    "longitud"
  # t.string   "codigo"
  # t.string   "internet"
  # t.string   "codigo_saa"
  # t.date     "fecha_activo"
  # t.date     "fecha_inactivo"

  establecimientos = path.format(file='establecimientos', ext='json')
  result = json.loads(open(establecimientos).read())
  for row in result:
    if '' in row:
      continue
    data = (
      row["id"],
      row["nombre"],
      row["tipo"],
      row["direccion"],
      row["telefono"],
      row["responsable"],
      row["dependeDe"],
      row["estado"],
      row["latitud"],
      row["longitud"],
      row["codigo"],
      row["internet"],
      row["codigoSaa"],
      # datetime.fromtimestamp(row["fechaActivo"]),
      # datetime.fromtimestamp(row["fechaInactivo"]),
      datetime.now(),
      datetime.now(),
      datetime.now(),
      datetime.now()
    )
    try:
      print(data)
      statement = """INSERT INTO establecimientos (id, 
                                            nombre,
                                            tipo,
                                            direccion,
                                            telefono,
                                            responsable,
                                            depende_de,
                                            estado,
                                            latitud,
                                            longitud,
                                            codigo,
                                            internet,
                                            codigo_saa,
                                            fecha_activo,
                                            fecha_inactivo,
                                            created_at, 
                                            updated_at) 
                              VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, 
                                      %s, %s, %s, %s, %s, %s, %s, %s)"""
      
      cursorPostgreSQL.execute(statement, data)
    except Exception as e:
      # print(data)
      print (e)

import_establecimientos()
# def import_disponibles():
#   # codigoProducto,nombreProducto,tipoProducto,codigoEstablecimiento,nombreEstablecimiento,tipoEstablecimiento,disponible,fecha,periodicidad,nombreRegion,codigoRegion,nombreDistrito,codigoDistrito,codigoEstablecimientoSaa,tipoIngreso,fechaUltimoMovimiento,fechaDistribucion,mapa,id
#   # field1
#   # field2
#   # field3
#   # field4
#   # field5
#   # field6
#   # field7
#   # field8
#   # field9
#   # field10
#   # field11
#   # field12
#   # field13
#   # field14
#   # field15
#   # field16
#   # field17
#   # field18
#   # field19

# # Rails
#   # t.integer  "producto_id"
#   # t.integer  "establecimiento_id"
#   # t.string   "disponible"
#   # t.string   "fecha"
#   # t.string   "periodicidad"
#   # t.string   "tipo_ingreso"
#   # t.string   "fecha_ultimo_movimiento"
#   # t.string   "fecha_distribucion"

#   result = c.execute('select field1, field2, field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13, field14, field15, field16, field17, field18, field19 from disponibilidades')
#   for row in result:
#     print (row)



# def pfields(qty):
#   for i in ["# field%s" % i for i in range(1, qty)]:
#     print(i)

# def pcolumns(qty):
#   print(', '.join(["field%s" % i for i in range(1, qty)]))



# # createuser --interactive akuerappuser -d -P
# # asdf1234
# # createdb -E UNICODE -l C -T template0 akuerappdb --owner=akuerappuser
# # psql -U akuerappuser -h localhost -W -d akuerappdb
