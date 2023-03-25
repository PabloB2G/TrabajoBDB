import random

def cargarProteinas(nomFichero, inserciones):
    proteinas = open(nomFichero, 'r')
    try:
        next(proteinas)

        for lin in proteinas:
            idP, nom, org, lon = lin.split(sep=';')
            i = "INSERT INTO Proteina (idProteina, Longitud, Nombre, Organismo) VALUES ("
            i = i + "'" + idP + "', " + lon.strip() + ", '" + nom + "', '" + org + "');"
            inserciones.append(i)
        
    finally:
        proteinas.close()
        
def cargarEnfermedades(nomFichero, inserciones, idP):
    enfermedades = open(nomFichero, 'r')
    try:
        for lin in enfermedades:
            if (lin[0].isdigit() == True):
                inser = "INSERT INTO Enfermedad (idEnfermedad, CambioProteina, SignificanciaClinica) VALUES ("
                nombre = lin[9:len(lin)-1]
                lin = next(enfermedades)
                genes = lin[9:len(lin)-1]
                lin = next(enfermedades)
                cambio = lin[16:len(lin)-1]
                if (cambio == ""):
                    cambio = "Not registered"
                lin = next(enfermedades)
                sintomas = lin[14:len(lin)-1]
                lin = next(enfermedades)
                significance = lin[23:len(lin)-1]
                
                inser = inser + "'" + nombre + "', '" + cambio + "', '" + significance + "');"
                inserciones.append(inser)
                inserProtEnfe = "INSERT INTO Proteina_has_Enfermedad (Proteina_idProteina, Enfermedad_idEnfermedad) VALUES ('" + idP + "', '" + nombre + "');"
                inserciones.append(inserProtEnfe)
                cargarGenes(nombre, genes, inserciones)
                cargarSintomas(nombre, sintomas, inserciones)
                
    finally:
        enfermedades.close()
        
def cargarGenes(idEnfermedad, genes, inserciones):
    arrayGen = genes.split(",")
    rango = len(arrayGen)
    maximo = random.randint(10,15)
    if (rango > maximo):
        rango = maximo
        
    for i in range(rango):
        gen = arrayGen[i].strip()
        inserGen = "INSERT IGNORE INTO Genes (Nombre) VALUES ('" + gen + "');"
        inserciones.append(inserGen)
        inserEnferGen = "INSERT INTO Enfermedad_has_Genes (Enfermedad_idEnfermedad, Genes_Nombre) VALUES ('" + idEnfermedad + "', '" + gen + "');"
        inserciones.append(inserEnferGen)
        
def cargarSintomas(idEnfermedad, sintomas, inserciones):
    arraySintomas = sintomas.split(",")
    
    for i in range(len(arraySintomas)):
        sintoma = arraySintomas[i].strip()
        inserSintoma = "INSERT IGNORE INTO Sintomas (Descripcion) VALUES ('" + sintoma + "');"
        inserciones.append(inserSintoma)
        inserEnferSintoma = "INSERT INTO Sintomas_has_Enfermedad (Sintomas_Descripcion, Enfermedad_idEnfermedad) VALUES ('" + sintoma + "', '" + idEnfermedad + "');"
        inserciones.append(inserEnferSintoma)
    
def importarInserciones(nomFichero, inserciones):
    inser = open(nomFichero, 'w')
    try:
        for i in range(0,len(inserciones)):
            a = inserciones[i]
            inser.write(a)
            inser.write("\n")
    finally:
        inser.close()

# ----------------------------------

inser = []
idProteinas = ["P14735", "P06213", "A2VEY9"] 
cargarProteinas("proteinas.csv", inser)
for i in range(len(idProteinas)):
    cargarEnfermedades(idProteinas[i] + ".txt", inser, idProteinas[i])
importarInserciones("inserciones.sql", inser)
