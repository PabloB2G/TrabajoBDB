# Muestra las proteinas que tengan una longitud mayor a x
# He anyadido un indice a la tabla Proteina: longitud
select idProteina, Nombre, longitud
from Proteina
where longitud > 700;

# Muestra el nombre y la longitud de las proteinas que no esten presentes en ninguna enfermedad
select Proteina.Nombre, Proteina.Longitud
from Proteina 
left JOIN Proteina_has_Enfermedad 
ON Proteina.idProteina = Proteina_has_Enfermedad.Proteina_idProteina
where Proteina_has_Enfermedad.Proteina_idProteina is null;

# Muestra los articulos publicados antes de un articulo dado
# He puesto un indice en la tabla Articulo con la Fecha
select Nombre, Fecha
from Articulo
where Fecha < (select Fecha from Articulo where idArticulo = "40")
order by Fecha desc
limit 10;
