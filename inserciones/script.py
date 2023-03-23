import random
import datetime
import radar 

data = open("data.sql", "w")
nombres = ["La peor enfermedad del mundo", "La mejor enfermedad del mundo", "Se descubre nueva proteína", "No queda nada por descubrir"]

autores = {"VICTOR_GUIRADO_OSORIO": "00000001V",
           "SUSANA_ROCIO_FERNANDEZ_GIACCOMASSI": "00000001S",
           "PABLO_BERMUDEZ_GAMEZ": "00000001P",
           "PABLO_MORENO_GARCIA-ESPINA": "00000002P",
           "ISMAEL_NAVAS_DELGADO": "00000001I",
           "SANDRO_JOSE_HURTADO_REQUENA": "00000002S",
           "PEDRO SANCHEZ": "11111111"}

for autor in autores:
    data.write(f"INSERT INTO Autor (idAutor, Nombre) VALUES ('{autores[autor]}', '{autor}');\n")

enfermedades = ["GRCh37/hg19 10q11.21-26.3(chr10:42347406-135534747)x1",
                "GRCh38/hg38 19p13.3-13.2(chr19:1972245-9648879)x3",
                "GRCh38/hg38 21p11.2-q22.3(chr21:7749532-46670405)x3",
                "GRCh38/hg38 21q11.2-22.3(chr21:7749532-46677460)x3",
                "NC_000019.10:g.(?_7112255)_(7249328_?)del",
                "NM_000208.3(INSR):c.*4802C>T",
                "NM_000208.3(INSR):c.*4803G>A",
                "NM_004969.4(IDE):c.2779T>C (p.Tyr927His)",
                "NM_004969.4(IDE):c.2866G>A (p.Val956Ile)",
                "NM_004969.4(IDE):c.2890G>T (p.Asp964Tyr)",
                "NM_004969.4(IDE):c.2932A>G (p.Ile978Val)"]

def generate_table_articulo(n):
    for i in range(n):
        nombre = random.choice(nombres)
        fecha = radar.random_datetime(start = datetime.datetime(year=2000, month=1, day=1),
                              stop = datetime.datetime(year=2023, month=3, day=24)
                             )
        enfermedad_id = random.choice(enfermedades)
        data.write(f"INSERT INTO Articulo (Nombre, Fecha, Enfermedad_idEnfermedad) VALUES ('{nombre}', '{fecha}', '{enfermedad_id}');\n")

def generate_table_articulo_autor(n):
    for i in range(n):
        autor = random.choice([*autores.keys()])
        data.write(f"INSERT INTO Articulo_has_Autor (Articulo_idArticulo, Autor_idAutor) VALUES ({i+1}, '{autores[autor]}');\n")

generate_table_articulo(100)
generate_table_articulo_autor(100)