import csv
import sqlite3



# c.execute("SELECT * FROM stocks WHERE symbol = '%s'" % symbol)
# c.execute('select field1, field2 from establecimientos where field1 not like "nombre%" group by field1, field2 ')

# Do this instead
database = "/home/luisvaldes/workspace/ruby-workspace/akuerapp_opendata.db"
railsDatabase = "/home/luisvaldes/workspace/ruby-workspace/akuerapp/db/development.sqlite3"

# conn = sqlite3.connect(database)
railsConn = sqlite3.connect(railsDatabase)
# c = conn.cursor()
railsDB = railsConn.cursor(railsConn)

path = "~/workspace/ruby-workspace/data-mspbs/{file}.csv"


def import_regiones():
  # field1 => nombreRegion
  # field2 => codigoRegion
# Rails
  # t.string   "nombre"  
  mapping = {
    "nombre": "field1",
    "id": "field2"
  }
  result = c.execute('select field1, field2 from establecimientos where field1 not like "nombre%" group by field1, field2 ')
  for row in result:
    data = (row[mapping["id"]], row[mapping["nombre"]])
    c.execute('INSERT INTO regiones VALUES (id,nombre)', data)

def import_distritos():
  # field2  => codigoRegion
  # field3  => nombreDistrito
  # field21 => codigoDistritoSaa

# Rails 
# t.integer  "region_id"
# t.string   "region"
# t.string   "nombre"

  result = c.execute('select field2, field3, field21 from establecimientos where field3 not like "nombre%" group by field2, field3, field21 ')
  for row in result:
    print (row)

def import_productos():
  # tipoProducto,codigoDncp,nombre,estado,codigo,mapa,clasificadorProducto,subclasificadorProducto,
  # concentracion,formaFarmaceutica,presentacion,codigoGrupoFarmacologico,nombreGrupoFarmacologico,
  # codigoSubgrupoFarmacologico,nombreSubgrupoFarmacologico,tipoAdquisicion,id
  # field1 => tipoProducto
  # field2 => codigoDncp
  # field3 => nombre
  # field4 => estado
  # field5 => codigo
  # field6 => mapa
  # field7 => clasificadorProducto
  # field8 => subclasificadorProducto
  # field9 => concentracion
  # field10 => formaFarmaceutica
  # field11 => presentacion
  # field12 => codigoGrupoFarmacologico
  # field13 => nombreGrupoFarmacologico
  # field14 => codigoSubgrupoFarmacologico
  # field15 => nombreSubgrupoFarmacoligico
  # field16 => tipoAdquisicion
  # field17 => id

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
  result = c.execute('select field1, field2, field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13, field14, field15, field16, field17 from productos where field3 not like "nombre%"')
  for row in result:
    print (row)

def import_establecimientos():
  # nombreRegion,codigoRegion,nombreDistrito,nombre,tipo,direccion,telefono,responsable,
  # dependeDe,estado,latitud,longitud,codigo,nombreMunicipio,codigoMunicipio,internet,
  # codigoSaa,fechaActivo,fechaInactivo,nombreDistritoSaa,codigoDistritoSaa,id
  # field1
  # field2
  # field3
  # field4
  # field5
  # field6
  # field7
  # field8
  # field9
  # field10
  # field11
  # field12
  # field13
  # field14
  # field15
  # field16
  # field17
  # field18
  # field19
  # field20
  # field21
  # field22

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

  result = c.execute('select field1, field2, field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13, field14, field15, field16, field17, field18, field19, field20, field21, field22 from establecimientos where field3 not like "nombre%" group by field2, field3, field21 ')
  for row in result:
    print (row)

def import_disponibles():
  # codigoProducto,nombreProducto,tipoProducto,codigoEstablecimiento,nombreEstablecimiento,tipoEstablecimiento,disponible,fecha,periodicidad,nombreRegion,codigoRegion,nombreDistrito,codigoDistrito,codigoEstablecimientoSaa,tipoIngreso,fechaUltimoMovimiento,fechaDistribucion,mapa,id
  # field1
  # field2
  # field3
  # field4
  # field5
  # field6
  # field7
  # field8
  # field9
  # field10
  # field11
  # field12
  # field13
  # field14
  # field15
  # field16
  # field17
  # field18
  # field19

# Rails
  # t.integer  "producto_id"
  # t.integer  "establecimiento_id"
  # t.string   "disponible"
  # t.string   "fecha"
  # t.string   "periodicidad"
  # t.string   "tipo_ingreso"
  # t.string   "fecha_ultimo_movimiento"
  # t.string   "fecha_distribucion"

  result = c.execute('select field1, field2, field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13, field14, field15, field16, field17, field18, field19 from disponibilidades')
  for row in result:
    print (row)



def pfields(qty):
  for i in ["# field%s" % i for i in range(1, qty)]:
    print(i)

def pcolumns(qty):
  print(', '.join(["field%s" % i for i in range(1, qty)]))
