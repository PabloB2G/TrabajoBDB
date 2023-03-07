INSERT INTO `mydb`.`Proteina` (`idProteina`, `Secuencia`, `Nombre`) VALUES ('pr1', 'AGA', 'pruebaprot');

INSERT INTO `mydb`.`Enfermedad` (`idEnfermedad`, `FechaInclusion`, `Prevalencia`, `Genes`) VALUES ('e1', '2000-01-01', '1/10000', 'gen1');

INSERT INTO `mydb`.`Proteina_has_Enfermedad` (`Proteina_idProteina`, `Enfermedad_idEnfermedad`) VALUES ('pr1', 'e1');

INSERT INTO `mydb`.`Articulo` (`idArticulo`, `Nombre`, `Enfermedad_idEnfermedad`) VALUES ('art1', 'articulopru', 'e1');

INSERT INTO `mydb`.`Autor` (`idAutor`) VALUES ('au1');

INSERT INTO `mydb`.`Enfermedad_has_Autor` (`Enfermedad_idEnfermedad`, `Autor_idAutor`) VALUES ('e1', 'au1');

INSERT INTO `mydb`.`Sintomas` (`idSintomas`, `Descripcion`) VALUES ('si1', 'malo');

INSERT INTO `mydb`.`Sintomas_has_Enfermedad` (`Sintomas_idSintomas`, `Enfermedad_idEnfermedad`) VALUES ('si1', 'e1');
