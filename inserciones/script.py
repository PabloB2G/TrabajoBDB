import random
import datetime
import radar 

data = open("D:/IngSalud/3º/Bases de datos/data.txt", "w")
nombres = ["La peor enfermedad del mundo", "La mejor enfermedad del mundo", "Se descubre nueva proteína", "No queda nada por descubrir"]

def generate_table_articulo(n):
    """Inserta los autores en la tabla artículo."""
    
    for i in range(n):
        nombre = random.choice(nombres)
        fecha = radar.random_datetime(start = datetime.datetime(year=2000, month=1, day=1),
                              stop = datetime.datetime(year=2023, month=3, day=24)
                             )
        data.write(f"INSERT INTO Articulo (idArticulo, Nombre, Fecha, Enfermedad_idEnfermedad) VALUES ('{i}', '{nombre}', '{fecha}', '{i}');\n")

generate_table_articulo(100)