#En Linux se puede usar pymysql o mysqldb
import pymysql
import pymysql.cursors
import json

db = pymysql.connect(host="localhost",user="basesUser",password="1234",db="bases2",charset="utf8mb4",cursorclass=pymysql.cursors.DictCursor)

cur = db.cursor()

#Dirección es donde se va a encontrar el archivo para leer
#Cambiar direcciones
def Hadoop3(direccion):
    archivo = open("C:/Users/papin/Desktop/ejemplo.txt", "r", encoding="utf-8")
    for x in archivo.readlines():
        fila = x.split()
        if len(fila) != 0:
            sql = "INSERT INTO bases2.palabra_contador (Palabra, Cantidad) \
            VALUES ('%s','%s')" % (fila[0], fila[1])
            try:
                cur.execute(sql)
                db.commit()
            except:
                print("hola")
                db.rollback()

def Hadoop1(direccion):
    archivo = open("C:/Users/papin/Desktop/links.json", "r", encoding="utf-8")
    for x in archivo.readlines():
        dic = json.loads(x)
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
                print()
cur.close()
db.close()
