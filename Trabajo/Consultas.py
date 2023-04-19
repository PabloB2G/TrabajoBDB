import pymysql.cursors


class Consultas(object):

    def __init__(self, host, user, password, database):
        # Connect to the database.
        self.connection = pymysql.connect(host=host,
                                          user=user,
                                          password=password,
                                          db=database,
                                          charset='utf8mb4',
                                          cursorclass=pymysql.cursors.DictCursor)

        print("connect successful!!")

    def print_query(self, query):
        try:
            # Abrimos un cursor
            with self.connection.cursor() as self.cursor:
                self.cursor.execute(query)
                print()
                for row in self.cursor:
                    print(row)
        except Exception as ex:
            print(ex)

    def close(self):
        self.connection.close()


if __name__ == '__main__':
    test = Consultas('localhost', 'root', '142@5j5ua2nlo7l@', 'TrabajoBDB')
    print("Escriba el número de la opción que quiera realizar: ")
    print("1 Mostrar las proteinas que tengan una longitud mayor a x")
    print("2 Mostrar el nombre y la longitud de las proteinas que no esten presentes en ninguna enfermedad")
    print("3 Muestra los articulos publicados antes de un articulo dado")
    print("4 Muestra aquellos artículos publicados a partir de una fecha dada")
    print("5 Muestra las enfermedades que tengan un síntoma específico")
    print("6 Muestra aquellas enfermedades relacionadas con más de x genes")

    num = input()
    if num == "1":
        print("Elija el valor de la longitud:")
        x = input()
        sql = 'select idProteina, Nombre, longitud from Proteina where longitud > ' + x + ';'
    elif num == "2":
        sql = 'select Proteina.Nombre, Proteina.Longitud from Proteina left JOIN Proteina_has_Enfermedad ON ' \
              'Proteina.idProteina = Proteina_has_Enfermedad.Proteina_idProteina where ' \
              'Proteina_has_Enfermedad.Proteina_idProteina is null;'
    elif num == "3":
        print("Elija el id del artículo:")
        x = input()
        sql = 'select Nombre, Fecha from Articulo where Fecha < (select Fecha from Articulo where idArticulo = "' + x + '") ' \
                                                                                                                        'order by Fecha desc limit 10;'
    elif num == "4":
        sql = "SELECT * FROM Articulo WHERE fecha >= '2020-01-01';"
    elif num == "5":
        sql = "SELECT Enfermedad.idEnfermedad from Enfermedad JOIN Sintomas_has_Enfermedad ON Enfermedad.idEnfermedad = Sintomas_has_Enfermedad.Enfermedad_idEnfermedad WHERE Sintomas_has_Enfermedad.Sintomas_Descripcion = 'Leprechaunism syndrome';"  
    elif num == "6":
        print("Elija el número de genes:")
        x = input()
        sql = "SELECT idEnfermedad from Enfermedad WHERE (SELECT COUNT(Genes_nombre) from Enfermedad_has_Genes WHERE Enfermedad_idEnfermedad = idEnfermedad) >" + x + ";"                                                                                                 

    test.print_query(sql)
    test.close()
