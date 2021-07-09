
CREATE TABLE Personal
(
	Codigo               SMALLINT AUTO_INCREMENT,
	Nombres              VARCHAR(35) NOT NULL,
	ApellidoPaterno      VARCHAR(20) NOT NULL,
	ApellidoMaterno      VARCHAR(20) NOT NULL,
	DNI     	     varchar(8) NOT NULL,
	Celular              CHAR(9) NOT NULL,
	Correo               VARCHAR(100) NOT NULL,
	Vigencia             BIT NOT NULL,
	FechaNacimiento	     Date NOT NULL,
 PRIMARY KEY (Codigo)
);

CREATE TABLE Usuario
(
	Vigencia             BIT NOT NULL,
	CodigoPersonal       SMALLINT NOT NULL,
	Codigo               SMALLINT AUTO_INCREMENT,
	Nombre               VARCHAR(30) NOT NULL,
	Clave                varchar(255) NOT NULL,
	Tipo                 CHAR(18) NOT NULL,
 PRIMARY KEY (Codigo)
);

CREATE TABLE Categoria
(
	Codigo               SMALLINT AUTO_INCREMENT,
	Nombre               VARCHAR(30) NOT NULL,
	Descripcion          VARCHAR(200) NOT NULL,
	Vigencia             BIT NOT NULL,
	CodigoEmpresa        SMALLINT NOT NULL,
 PRIMARY KEY (Codigo)
);



CREATE TABLE Empresa
(
	RazonSocial          VARCHAR(100) NOT NULL,
	RUC                  CHAR(11) NOT NULL,
	Facebook             VARCHAR(1000) NULL,
	Instagram            VARCHAR(1000) NOT NULL,
	Youtube              VARCHAR(1000) NOT NULL,
	Whatsapp             VARCHAR(9) NULL,
	Correo               VARCHAR(100) NOT NULL,
	Logo                 varchar(1000) NULL,
	Codigo               SMALLINT AUTO_INCREMENT,
	Vigencia             BIT NOT NULL,
 PRIMARY KEY (Codigo)
);


CREATE TABLE Local
(
	Codigo               SMALLINT AUTO_INCREMENT,
	Nombre               VARCHAR(100) NOT NULL,
	Direccion            VARCHAR(100) NULL,
	Telefono             CHAR(9) NULL,
	CodigoEmpresa        SMALLINT NOT NULL,
	Vigencia             BIT NOT NULL,
 PRIMARY KEY (Codigo)
);



CREATE TABLE Marca
(
	Codigo               SMALLINT AUTO_INCREMENT,
	Nombre               VARCHAR(60) NOT NULL,
	Vigencia             BIT NOT NULL,
 PRIMARY KEY (Codigo)
);




CREATE TABLE PrecioLocal
(
	Codigo               SMALLINT AUTO_INCREMENT,
	Precio               DECIMAL(8,4) NOT NULL,
	PrecioMinimo         DECIMAL(8,4) NOT NULL,
	Stock                SMALLINT NOT NULL,
	CodigoLocal          SMALLINT NOT NULL,
	CodigoProducto       SMALLINT NOT NULL,
	Vigencia             CHAR(18) NOT NULL,
	IGV                  DECIMAL(8,4) NOT NULL,
	ISC                  DECIMAL(8,4) NOT NULL,
	Exonerado            DECIMAL(8,4) NOT NULL,
	TipoISC              CHAR(18) NOT NULL,
 PRIMARY KEY (Codigo)
);



CREATE TABLE Producto
(
	Codigo               SMALLINT AUTO_INCREMENT,
	Nombre               VARCHAR(100) NOT NULL,
	TipoControl          CHAR(1) NOT NULL,
	Tipo                 CHAR(1) NOT NULL,
	CodigoCategoria      SMALLINT NOT NULL,
	Vigencia             BIT NOT NULL,
	Negociable           BIT NOT NULL,
	CodigoMarca          SMALLINT NOT NULL,
 PRIMARY KEY (Codigo)
);




ALTER TABLE Usuario
ADD FOREIGN KEY FK_Personal_Usuario (CodigoPersonal) REFERENCES Personal (Codigo);



ALTER TABLE Categoria
ADD FOREIGN KEY R_16 (CodigoEmpresa) REFERENCES Empresa (Codigo);



ALTER TABLE Local
ADD FOREIGN KEY FK_Empresa_Local (CodigoEmpresa) REFERENCES Empresa (Codigo);



ALTER TABLE PrecioLocal
ADD FOREIGN KEY R_18 (CodigoLocal) REFERENCES Local (Codigo);



ALTER TABLE PrecioLocal
ADD FOREIGN KEY R_19 (CodigoProducto) REFERENCES Producto (Codigo);



ALTER TABLE Producto
ADD FOREIGN KEY R_17 (CodigoCategoria) REFERENCES Categoria (Codigo);



ALTER TABLE Producto
ADD FOREIGN KEY R_24 (CodigoMarca) REFERENCES Marca (Codigo);


