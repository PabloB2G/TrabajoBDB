import random
import datetime
import radar 

data = open("D:/IngSalud/3º/Bases de datos/data.txt", "w")
nombres = ["La peor enfermedad del mundo", "La mejor enfermedad del mundo", "Se descubre nueva proteína", "No queda nada por descubrir"]

autores = {"VICTOR_GUIRADO_OSORIO": "00000001V",
           "SUSANA_ROCIO_FERNANDEZ_GIACCOMASSI": "00000001S",
           "PABLO_BERMUDEZ_GAMEZ": "00000001P",
           "PABLO_MORENO_GARCIA-ESPINA": "00000002P",
           "ISMAEL_NAVAS_DELGADO": "00000001I",
           "SANDRO_JOSE_HURTADO_REQUENA": "00000002S",
           "PEDRO SANCHEZ": "11111111"}

def generate_table_articulo(n):
    """Inserta los autores en la tabla artículo."""
    
    for i in range(n):
        nombre = random.choice(nombres)
        fecha = radar.random_datetime(start = datetime.datetime(year=2000, month=1, day=1),
                              stop = datetime.datetime(year=2023, month=3, day=24)
                             )
        data.write(f"INSERT INTO Articulo (idArticulo, Nombre, Fecha, Enfermedad_idEnfermedad) VALUES ('{i}', '{nombre}', '{fecha}', '{i}');\n")

def generate_table_articulo_autor(n):
    for i in range(n):
        autor = random.choice([*autores.keys()])
        data.write(f"INSERT INTO Articulo_has_Autor (Articulo_idArticulo, Autor_idAutor) VALUES ('{i}', '{autores[autor]}');\n")

generate_table_articulo(100)
generate_table_articulo_autor(100)