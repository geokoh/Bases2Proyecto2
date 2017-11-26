#En Linux se puede usar pymysql o mysqldb
import os, sys
import pymysql
import pymysql.cursors
import json
#Dirección es donde se va a encontrar el archivo para leer
#Cambiar direcciones
def Hadoop1(direccion):
    """Función encargada de ingresar la información del primer job de Hadoop"""

    #Conexion a mysql
    db = pymysql.connect(host="localhost",user="basesUser",password="1234",db="bases2",charset="utf8mb4",cursorclass=pymysql.cursors.DictCursor)
    cur = db.cursor()

    #Lectura de archivo
    archivo = open(direccion, "r", encoding="utf-8")
    for x in archivo.readlines():
        fila = x.split()
        #Insercion de datos a mysql 
        if len(fila) != 0:
            sql = "INSERT INTO bases2.palabra_contador (Palabra, Cantidad) \
            VALUES ('%s','%s')" % (fila[0], fila[1])
            try:
                cur.execute(sql)
                db.commit()
            except:
                print("hola")
                db.rollback()
    #Cierre de archicos y conexion
    archivo.close()
    cur.close()
    db.close()

def Hadoop3(direccion):
    """Función encargada de ingresar la información del tercer job de Hadoop"""

    #Conexion a mysql
    db = pymysql.connect(host="localhost",user="basesUser",password="1234",db="bases2",charset="utf8mb4",cursorclass=pymysql.cursors.DictCursor)
    cur = db.cursor()

    #Lectura de archivo
    archivo = open(direccion, "r", encoding="utf-8")
    for x in archivo.readlines():
        #Guarda el .json en diccionario de python
        dic = json.loads(x)
        
        #Insercion de datos a mysql 
        for paginas in range(len(dic['Paginas'])):
            sqlS = "SELECT idPalabra_Contador FROM bases2.palabra_contador where Palabra like '%s'" % ("%"+dic['Palabra'])
            sqlI = "INSERT INTO bases2.palabra_url (Link, PalabraID) \
    VALUES ('%s', '%s')"
            try:
                cur.execute(sqlS)
                idPalabra = cur.fetchall()
                cur.execute(sqlI % (dic['Paginas'][paginas]['Pagina'], str(idPalabra[0]['idPalabra_Contador'])))
                db.commit()
            except:
                db.rollback()
    #Cierre de archicos y conexion
    archivo.close()
    cur.close()
    db.close()

if __name__ == "__main__":
    archivo = sys.argv[1] #Guarda archivo para leer
    if sys.argv[2] == "Hadoop1":
        Hadoop1(archivo)
    elif sys.argv[2] == "Hadoop3":
        Hadoop3(archivo)
    else:
        print("No funciono")
#archivo.py "_nombre de archivo para leer_" _Nombre de Funcion_
#Nombre de funcion = Hadoop1 | Hadoop2 | Hadoop3
