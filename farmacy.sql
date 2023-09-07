drop database farmacia ; 
CREATE DATABASE FARMACIA;
USE FARMACIA;
-- Creación de la tabla de productos e ingreso de registros
CREATE TABLE productos(
	CodProd INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NomProd VARCHAR(45) NOT NULL,
	DesProd VARCHAR(80) NOT NULL,
	StoProd INT NOT NULL,
    ValVentProd DECIMAL(10,2) NOT NULL,
    IvaProd TINYINT NOT NULL,
    RucProvProd VARCHAR(30) NOT NULL
) AUTO_INCREMENT = 1;
drop table productos;
INSERT INTO productos (NomProd, DesProd, StoProd, ValVentProd, IvaProd, RucProvProd)
VALUES
('Paracetamol 500mg', 'Analgésico y antipirético, caja de 20 tabletas', 100, 3.50, 0.42, 'Farmaceutica XYZ'),
('Ibuprofeno 400mg', 'Antiinflamatorio no esteroideo, caja de 15 tabletas', 80, 4.20, 0.50, 'Farmaceutica XYZ'),
('Amoxicilina 250mg', 'Antibiótico, frasco de 30ml', 50, 7.80, 0.94, 'Farmaceutica ABC'),
('Loratadina 10mg', 'Antihistamínico, caja de 10 tabletas', 120, 5.60, 0.67, 'Farmaceutica ABC'),
('Vitaminas C', 'Suplemento vitamínico, frasco de 60 tabletas', 200, 9.95, 1.19, 'Farmaceutica Suplementos'),
('Omeprazol 20mg', 'Inhibidor de la bomba de protones, caja de 14 cápsulas', 60, 6.75, 0.81, 'Farmaceutica XYZ'),
('Aspirina 100mg', 'Analgésico y antipirético, caja de 30 tabletas', 150, 2.25, 0.27, 'Farmaceutica XYZ'),
('Salbutamol Inhalador', 'Broncodilatador, inhalador de 200 dosis', 40, 12.30, 1.48, 'Farmaceutica ABC'),
('Antiséptico Bucal', 'Enjuague bucal, frasco de 250ml', 90, 5.40, 0.65, 'Farmaceutica XYZ'),
('Calcio + Vitamina D', 'Suplemento para la salud ósea, frasco de 120 tabletas', 100, 11.75, 1.41, 'Farmaceutica Suplementos');
-- SELECT * FROM productos;
-- SELECT * FROM productos WHERE NomProd LIKE '%detergente%';
-- SELECT CodProd, NomProd, DesProd, StoProd, ValVentProd FROM productos;
-- SELECT CodProd, DesProd, ValVentProd FROM productos WHERE CodProd = 1;
-- SELECT MAX(CodProd) FROM productos;

CREATE TABLE cajeros(
	IdCaj INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomCaj VARCHAR(20) NOT NULL,
	ApeCaj VARCHAR(20) NOT NULL,
    DirCaj VARCHAR(80) ,
    CorCaj VARCHAR(30) NOT NULL,
    TelCaj VARCHAR(12) NOT NULL,
	UsuCaj VARCHAR(15) NOT NULL,
	ConCaj VARCHAR(20) NOT NULL
) AUTO_INCREMENT=1;
INSERT INTO cajeros (NomCaj, ApeCaj, DirCaj, CorCaj, TelCaj, UsuCaj, ConCaj)
VALUES
('Pablo','Arroyo','Quito, Miravalle 1, Carlos Dousdebes','pablo.arroyo@market.com','0998151451','cj1','cj1'),
('Maria','Fernandez','Quito, Centro Historico','maria.fernandez@market.com','0987127781','cj2','cj2'),
('Domenica','Lamar','Quito, Cumbaya, parque central','domenica.lamar@market.com','0992344242','cj3','cj3'),
('Michael','Ramirez','Quito, La Tola','michael.ramirez@market.com','0983451562','cj4','cj4');
-- SELECT * FROM cajeros;
-- SELECT UsuCaj, ConCaj, CONCAT(NomCaj,' ',ApeCaj), CorCaj FROM cajeros WHERE UsuCaj LIKE 'cj1';
-- SELECT UsuCaj, ConCaj, IdCaj FROM cajeros WHERE UsuCaj LIKE 'cj1';

-- Creacion de tabla cabeceras de facturas
CREATE TABLE cabecerasFacturas(
	NumFact INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    IdCajFact VARCHAR(10) NOT NULL REFERENCES cajeros(IdCaj),
	NomCliFact VARCHAR(60) NOT NULL,
	FecEmiFact DATE NOT NULL,
	SubFact DECIMAL(10,2),
    IvaFact DECIMAL(10,2),
    TotFact DECIMAL(10,2) 
);
INSERT INTO cabecerasFacturas (IdCajFact, NomCliFact, FecEmiFact, SubFact, IvaFact, TotFact)
VALUES
(1,'Juan Perez','2020-02-15',NULL,NULL,NULL),
(1,'Steven Sanchez','2020-03-17',NULL,NULL,NULL),
(1,'Ronald Guaman','2020-02-10',NULL,NULL,NULL),
(2,'Cristian Cevallos','2020-03-15',NULL,NULL,NULL);
-- SELECT * FROM cabecerasFacturas;
-- SELECT MAX(NumFact) FROM cabecerasFacturas;

-- Creacion de detalles de factura
CREATE TABLE detallesFacturas(
	CodDet INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NumFactDet INT NOT NULL REFERENCES cabecerasFacturas(NumFact),
	CodProdDet INT NOT NULL REFERENCES productos(CodProd),
	CanDet INT NOT NULL,
    ValVenDet DECIMAL(10,2) NOT NULL REFERENCES productos(ValVentProd),
    TotDet DECIMAL(10,2) 
);
INSERT INTO detallesFacturas (NumFactDet, CodProdDet, CanDet, ValVenDet, TotDet)
VALUES
(1,1,1,9.43,9.43),
(1,2,1,15.43,15.43),
(1,3,1,1.47,1.47),
(2,4,3,3.95,11.85);
-- SELECT * FROM detallesFacturas;
DROP TABLE administradores;
CREATE TABLE administradores(
	IdAdm INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomAdm VARCHAR(20) NOT NULL,
	ApeAdm VARCHAR(20) NOT NULL,
    DirAdm VARCHAR(80) ,
    CorAdm VARCHAR(30) NOT NULL,
    TelAdm VARCHAR(12) NOT NULL,
	UsuAdm VARCHAR(15) NOT NULL,
	ConAdm VARCHAR(20) NOT NULL
);

INSERT INTO administradores (NomAdm, ApeAdm, DirAdm, CorAdm, TelAdm, UsuAdm, ConAdm)
VALUES
('Martin','Jimenez','Quito, Tumbaco','martin.jimenez@gmail.com','0992387466','admin1','admin1'),
('Ismael','Novillo','Quito, Pifo','ismael.novillo@gmail.com','0985353412','admin2','admin2'),
('Cristhian','Pañora','Quito, Calderón','cristhian.panora@gmail.com','0995765215','admin3','admin3'),
('Cristian','Paredes','Quito, Tumbaco','cristian.paredes@gmail.com','0987551213','admin4','admin4');

SELECT*FROM administradores;
select*FROM detallesventas;
SELECT*FROM cajeros;
SELECT*FROM ventas;