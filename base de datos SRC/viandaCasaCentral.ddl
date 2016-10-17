-- Generado por Oracle SQL Developer Data Modeler 4.1.5.907
--   en:        2016-10-17 01:26:41 ART
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE CASA_CENTRAL
  (
    ID_CASA_CENT INTEGER NOT NULL ,
    DIRECCION    VARCHAR2 (30 BYTE) ,
    ID_CIUDAD    NUMBER (*,0) NOT NULL ,
    ID_STOCK     NUMBER (*,0) NOT NULL
  ) ;
CREATE UNIQUE INDEX CASA_CENTRAL__IDX ON CASA_CENTRAL
  (
    ID_CIUDAD ASC
  )
  ;
CREATE UNIQUE INDEX CASA_CENTRAL__IDXv1 ON CASA_CENTRAL
  (
    ID_STOCK ASC
  )
  ;
ALTER TABLE CASA_CENTRAL ADD CONSTRAINT CASA_CENTRAL_PK PRIMARY KEY ( ID_CASA_CENT ) ;


CREATE TABLE CIUDAD
  (
    ID_CIUDAD NUMBER (*,0) NOT NULL ,
    NOMBRE    VARCHAR2 (20 BYTE) ,
    ID_PAIS   NUMBER (*,0) NOT NULL
  ) ;
ALTER TABLE CIUDAD ADD CONSTRAINT CIUDAD_PK PRIMARY KEY ( ID_CIUDAD ) ;


CREATE TABLE CLAS_PLATO
  (
    ID_CLAS NUMBER (*,0) NOT NULL ,
    NOMBRE  VARCHAR2 (20 BYTE)
  ) ;
ALTER TABLE CLAS_PLATO ADD CONSTRAINT CLAS_PLATO_PK PRIMARY KEY ( ID_CLAS ) ;


CREATE TABLE CLIENTE
  (
    ID_CLIENTE NUMBER (*,0) NOT NULL ,
    DNI        VARCHAR2 (20 BYTE) NOT NULL ,
    APELLIDO   VARCHAR2 (20 BYTE) NOT NULL ,
    NOMBRE     VARCHAR2 (20 BYTE) NOT NULL ,
    USUARIO    VARCHAR2 (20 BYTE) ,
    PASSWORD   VARCHAR2 (20 BYTE) ,
    ACCESO     DATE ,
    TELEFONO   VARCHAR2 (15 BYTE) ,
    DIRECCION  VARCHAR2 (50 BYTE) ,
    EMAIL      VARCHAR2 (30 BYTE) ,
    ID_CIUDAD  NUMBER (*,0) NOT NULL
  ) ;
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( ID_CLIENTE ) ;


CREATE TABLE DELIVERY
  (
    ID_DELIVERY NUMBER (*,0) NOT NULL ,
    NOMBRE      VARCHAR2 (20 BYTE) ,
    DIRECCION   VARCHAR2 (20 BYTE)
  ) ;
ALTER TABLE DELIVERY ADD CONSTRAINT DELIVERY_PK PRIMARY KEY ( ID_DELIVERY ) ;


CREATE TABLE DET_MENU
  (
    ID_PLATO NUMBER (*,0) NOT NULL ,
    ID_MENU  NUMBER (*,0) NOT NULL
  ) ;


CREATE TABLE DET_OC
  (
    FECHA DATE ,
    CANTIDAD FLOAT ,
    ID_OC       NUMBER (*,0) NOT NULL ,
    ID_PRODUCTO NUMBER (*,0) NOT NULL ,
    ID_PROV     NUMBER (*,0) NOT NULL
  ) ;


CREATE TABLE DET_PEDIDO
  (
    CANTIDAD INTEGER ,
    SUBTOTAL FLOAT ,
    ID_PEDIDO NUMBER (*,0) NOT NULL ,
    ID_MENU   NUMBER (*,0) NOT NULL
  ) ;


CREATE TABLE DET_PROV
  (
    ID_PRODUCTO NUMBER (*,0) NOT NULL ,
    LOTE_MIN FLOAT ,
    PRECIO FLOAT ,
    ID_PROV       NUMBER (*,0) NOT NULL ,
    ID_UNID_PROV  NUMBER (*,0) NOT NULL ,
    CANT_UNI_PROD INTEGER
  ) ;
CREATE UNIQUE INDEX DET_PROV__IDX ON DET_PROV
  (
    ID_UNID_PROV ASC
  )
  ;
ALTER TABLE DET_PROV ADD CONSTRAINT DET_PROV_PK PRIMARY KEY ( ID_PRODUCTO, ID_PROV ) ;


CREATE TABLE DET_RECETA
  (
    CANTIDAD FLOAT ,
    ID_PRODUCTO NUMBER (*,0) NOT NULL ,
    ID_PLATO    NUMBER (*,0) NOT NULL
  ) ;


CREATE TABLE DET_STOC
  (
    CANTIDAD FLOAT ,
    STOCK_CRITICO FLOAT ,
    ID_STOCK    NUMBER (*,0) NOT NULL ,
    ID_PRODUCTO NUMBER (*,0) NOT NULL
  ) ;


CREATE TABLE EMISOR_TC
  (
    ID_EMISOR NUMBER (*,0) NOT NULL ,
    NOMBRE    VARCHAR2 (20 BYTE)
  ) ;
ALTER TABLE EMISOR_TC ADD CONSTRAINT EMISOR_TC_PK PRIMARY KEY ( ID_EMISOR ) ;


CREATE TABLE F_HORA
  (
    ID_F_HORA     NUMBER (*,0) NOT NULL ,
    INICIO_FRANJA NUMBER (*,0) ,
    FIN_FRANJA    NUMBER (*,0)
  ) ;
ALTER TABLE F_HORA ADD CONSTRAINT F_HORA_PK PRIMARY KEY ( ID_F_HORA ) ;


CREATE TABLE INSTITUCION
  (
    ID_INST   NUMBER (*,0) NOT NULL ,
    NOMBRE    VARCHAR2 (20 BYTE) ,
    DIRECCION VARCHAR2 (20 BYTE) ,
    TELEFONO  VARCHAR2 (20 BYTE) ,
    PRIORIDAD NUMBER (*,0) ,
    ID_SUC    NUMBER (*,0) NOT NULL
  ) ;
ALTER TABLE INSTITUCION ADD CONSTRAINT INSTITUCION_PK PRIMARY KEY ( ID_INST ) ;


CREATE TABLE MENU
  (
    ID_MENU         NUMBER (*,0) NOT NULL ,
    DESCRIPCION     VARCHAR2 (20 BYTE) ,
    INICIO_VIGENCIA DATE ,
    FIN_VIGENCIA    DATE ,
    PRECIO          NUMBER
  ) ;
ALTER TABLE MENU ADD CONSTRAINT MENU_PK PRIMARY KEY ( ID_MENU ) ;


CREATE TABLE NOTA_CREDITO
  (
    ID_NC INTEGER NOT NULL ,
    IMPORTE FLOAT (126) ,
    ID_TC NUMBER (*,0) NOT NULL
  ) ;
ALTER TABLE NOTA_CREDITO ADD CONSTRAINT NOTA_CREDITO_PK PRIMARY KEY ( ID_NC ) ;


CREATE TABLE ORD_COMP
  (
    ID_OC        NUMBER (*,0) NOT NULL ,
    FECHA        DATE ,
    ID_CASA_CENT INTEGER NOT NULL
  ) ;
ALTER TABLE ORD_COMP ADD CONSTRAINT ORD_COMP_PK PRIMARY KEY ( ID_OC ) ;


CREATE TABLE PAIS
  (
    ID_PAIS NUMBER (*,0) NOT NULL ,
    NOMBRE  VARCHAR2 (20 BYTE)
  ) ;
ALTER TABLE PAIS ADD CONSTRAINT PAIS_PK PRIMARY KEY ( ID_PAIS ) ;


CREATE TABLE PEDIDO
  (
    ID_PEDIDO NUMBER (*,0) NOT NULL ,
    FECHA     DATE ,
    TOTAL FLOAT (126) ,
    ENTREGADO    CHAR (1 BYTE) ,
    EFECTIVO     CHAR (1 BYTE) ,
    DELIVERY     CHAR (1 BYTE) ,
    ID_F_HORA    NUMBER (*,0) NOT NULL ,
    ID_CLIENTE   NUMBER (*,0) NOT NULL ,
    ID_CASA_CENT INTEGER NOT NULL
  ) ;
ALTER TABLE PEDIDO ADD CONSTRAINT PEDIDO_PK PRIMARY KEY ( ID_PEDIDO ) ;


CREATE TABLE PLATO
  (
    ID_PLATO     NUMBER (*,0) NOT NULL ,
    NOMBRE       VARCHAR2 (20 BYTE) ,
    TEMP_C       NUMBER (*,0) ,
    CONSERVACION NUMBER (*,0) ,
    TIEMP_CAL    NUMBER (*,0) ,
    ID_TIPO      NUMBER (*,0) NOT NULL ,
    ID_CLAS      NUMBER (*,0) NOT NULL
  ) ;
ALTER TABLE PLATO ADD CONSTRAINT PLATO_PK PRIMARY KEY ( ID_PLATO ) ;


CREATE TABLE PRODUCTO
  (
    ID_PRODUCTO NUMBER (*,0) NOT NULL ,
    NOMBRE      VARCHAR2 (20 BYTE) ,
    ID_UN       INTEGER NOT NULL ,
    ID_STOCK    NUMBER (*,0) NOT NULL
  ) ;
CREATE UNIQUE INDEX PRODUCTO__IDX ON PRODUCTO
  (
    ID_UN ASC
  )
  ;
ALTER TABLE PRODUCTO ADD CONSTRAINT PRODUCTO_PK PRIMARY KEY ( ID_PRODUCTO ) ;


CREATE TABLE PROVEEDOR
  (
    ID_PROV   NUMBER (*,0) NOT NULL ,
    NOMBRE    VARCHAR2 (20 BYTE) ,
    DOMICILIO VARCHAR2 (20 BYTE) ,
    PLAZO_PAG NUMBER (*,0)
  ) ;
ALTER TABLE PROVEEDOR ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY ( ID_PROV ) ;


CREATE TABLE RADIO_ENTREGA
  (
    COD_POSTAL   INTEGER NOT NULL ,
    ZONA         VARCHAR2 (30 BYTE) ,
    ID_DELIVERY  NUMBER (*,0) NOT NULL ,
    ID_CASA_CENT INTEGER NOT NULL
  ) ;
ALTER TABLE RADIO_ENTREGA ADD CONSTRAINT RADIO_ENTREGA_PK PRIMARY KEY ( COD_POSTAL ) ;


CREATE TABLE STOCK
  ( ID_STOCK NUMBER (*,0) NOT NULL
  ) ;
ALTER TABLE STOCK ADD CONSTRAINT STOCK_PK PRIMARY KEY ( ID_STOCK ) ;


CREATE TABLE SUCURSAL
  (
    ID_SUC       NUMBER (*,0) NOT NULL ,
    NOMBRE       VARCHAR2 (20 BYTE) ,
    DOMICILIO    VARCHAR2 (20 BYTE) ,
    ID_CIUDAD    NUMBER (*,0) NOT NULL ,
    ID_CASA_CENT INTEGER NOT NULL
  ) ;
ALTER TABLE SUCURSAL ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( ID_SUC ) ;


CREATE TABLE TC
  (
    ID_TC      NUMBER (*,0) NOT NULL ,
    NUMERO     VARCHAR2 (20 BYTE) ,
    COD_SEG    VARCHAR2 (20 BYTE) ,
    FECHA_VENC VARCHAR2 (20 BYTE) ,
    ID_CLIENTE NUMBER (*,0) NOT NULL ,
    ID_EMISOR  NUMBER (*,0) NOT NULL
  ) ;
ALTER TABLE TC ADD CONSTRAINT TC_PK PRIMARY KEY ( ID_TC ) ;


CREATE TABLE TIPO_PLATO
  (
    ID_TIPO NUMBER (*,0) NOT NULL ,
    NOMBRE  VARCHAR2 (20 BYTE)
  ) ;
ALTER TABLE TIPO_PLATO ADD CONSTRAINT TIPO_PLATO_PK PRIMARY KEY ( ID_TIPO ) ;


CREATE TABLE UNIDAD_PROD
  (
    ID_UN  INTEGER NOT NULL ,
    NOMBRE VARCHAR2 (20 BYTE)
  ) ;
ALTER TABLE UNIDAD_PROD ADD CONSTRAINT UNIDAD_PROD_PK PRIMARY KEY ( ID_UN ) ;


CREATE TABLE UNI_PROVEEDOR
  (
    ID_UNID_PROV NUMBER (*,0) NOT NULL ,
    NOMBRE       VARCHAR2 (20 BYTE)
  ) ;
ALTER TABLE UNI_PROVEEDOR ADD CONSTRAINT UNI_PROVEEDOR_PK PRIMARY KEY ( ID_UNID_PROV ) ;


ALTER TABLE CASA_CENTRAL ADD CONSTRAINT CASA_CENTRAL_CIUDAD_FK FOREIGN KEY ( ID_CIUDAD ) REFERENCES CIUDAD ( ID_CIUDAD ) ;

ALTER TABLE CASA_CENTRAL ADD CONSTRAINT CASA_CENTRAL_STOCK_FK FOREIGN KEY ( ID_STOCK ) REFERENCES STOCK ( ID_STOCK ) ;

ALTER TABLE CIUDAD ADD CONSTRAINT CIUDAD_PAIS_FK FOREIGN KEY ( ID_PAIS ) REFERENCES PAIS ( ID_PAIS ) ;

ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_CIUDAD_FK FOREIGN KEY ( ID_CIUDAD ) REFERENCES CIUDAD ( ID_CIUDAD ) ;

ALTER TABLE DET_MENU ADD CONSTRAINT DET_MENU_MENU_FK FOREIGN KEY ( ID_MENU ) REFERENCES MENU ( ID_MENU ) ;

ALTER TABLE DET_MENU ADD CONSTRAINT DET_MENU_PLATO_FK FOREIGN KEY ( ID_PLATO ) REFERENCES PLATO ( ID_PLATO ) ;

ALTER TABLE DET_OC ADD CONSTRAINT DET_OC_DET_PROV_FK FOREIGN KEY ( ID_PRODUCTO, ID_PROV ) REFERENCES DET_PROV ( ID_PRODUCTO, ID_PROV ) ;

ALTER TABLE DET_OC ADD CONSTRAINT DET_OC_ORD_COMP_FK FOREIGN KEY ( ID_OC ) REFERENCES ORD_COMP ( ID_OC ) ;

ALTER TABLE DET_PEDIDO ADD CONSTRAINT DET_PEDIDO_MENU_FK FOREIGN KEY ( ID_MENU ) REFERENCES MENU ( ID_MENU ) ;

ALTER TABLE DET_PEDIDO ADD CONSTRAINT DET_PEDIDO_PEDIDO_FK FOREIGN KEY ( ID_PEDIDO ) REFERENCES PEDIDO ( ID_PEDIDO ) ;

ALTER TABLE DET_PROV ADD CONSTRAINT DET_PROV_PRODUCTO_FK FOREIGN KEY ( ID_PRODUCTO ) REFERENCES PRODUCTO ( ID_PRODUCTO ) ;

ALTER TABLE DET_PROV ADD CONSTRAINT DET_PROV_PROVEEDOR_FK FOREIGN KEY ( ID_PROV ) REFERENCES PROVEEDOR ( ID_PROV ) ;

ALTER TABLE DET_PROV ADD CONSTRAINT DET_PROV_UNI_PROVEEDOR_FK FOREIGN KEY ( ID_UNID_PROV ) REFERENCES UNI_PROVEEDOR ( ID_UNID_PROV ) ;

ALTER TABLE DET_RECETA ADD CONSTRAINT DET_RECETA_PLATO_FK FOREIGN KEY ( ID_PLATO ) REFERENCES PLATO ( ID_PLATO ) ;

ALTER TABLE DET_RECETA ADD CONSTRAINT DET_RECETA_PRODUCTO_FK FOREIGN KEY ( ID_PRODUCTO ) REFERENCES PRODUCTO ( ID_PRODUCTO ) ;

ALTER TABLE DET_STOC ADD CONSTRAINT DET_STOC_PRODUCTO_FK FOREIGN KEY ( ID_PRODUCTO ) REFERENCES PRODUCTO ( ID_PRODUCTO ) ;

ALTER TABLE DET_STOC ADD CONSTRAINT DET_STOC_STOCK_FK FOREIGN KEY ( ID_STOCK ) REFERENCES STOCK ( ID_STOCK ) ;

ALTER TABLE INSTITUCION ADD CONSTRAINT INSTITUCION_SUCURSAL_FK FOREIGN KEY ( ID_SUC ) REFERENCES SUCURSAL ( ID_SUC ) ;

ALTER TABLE NOTA_CREDITO ADD CONSTRAINT NOTA_CREDITO_TC_FK FOREIGN KEY ( ID_TC ) REFERENCES TC ( ID_TC ) ;

ALTER TABLE ORD_COMP ADD CONSTRAINT ORD_COMP_CASA_CENTRAL_FK FOREIGN KEY ( ID_CASA_CENT ) REFERENCES CASA_CENTRAL ( ID_CASA_CENT ) ;

ALTER TABLE PEDIDO ADD CONSTRAINT PEDIDO_CASA_CENTRAL_FK FOREIGN KEY ( ID_CASA_CENT ) REFERENCES CASA_CENTRAL ( ID_CASA_CENT ) ;

ALTER TABLE PEDIDO ADD CONSTRAINT PEDIDO_CLIENTE_FK FOREIGN KEY ( ID_CLIENTE ) REFERENCES CLIENTE ( ID_CLIENTE ) ;

ALTER TABLE PEDIDO ADD CONSTRAINT PEDIDO_F_HORA_FK FOREIGN KEY ( ID_F_HORA ) REFERENCES F_HORA ( ID_F_HORA ) ;

ALTER TABLE PLATO ADD CONSTRAINT PLATO_CLAS_PLATO_FK FOREIGN KEY ( ID_CLAS ) REFERENCES CLAS_PLATO ( ID_CLAS ) ;

ALTER TABLE PLATO ADD CONSTRAINT PLATO_TIPO_PLATO_FK FOREIGN KEY ( ID_TIPO ) REFERENCES TIPO_PLATO ( ID_TIPO ) ;

ALTER TABLE PRODUCTO ADD CONSTRAINT PRODUCTO_STOCK_FK FOREIGN KEY ( ID_STOCK ) REFERENCES STOCK ( ID_STOCK ) ;

ALTER TABLE PRODUCTO ADD CONSTRAINT PRODUCTO_UNIDAD_PROD_FK FOREIGN KEY ( ID_UN ) REFERENCES UNIDAD_PROD ( ID_UN ) ;

ALTER TABLE RADIO_ENTREGA ADD CONSTRAINT RADIO_ENTREGA_CASA_CENTRAL_FK FOREIGN KEY ( ID_CASA_CENT ) REFERENCES CASA_CENTRAL ( ID_CASA_CENT ) ;

ALTER TABLE RADIO_ENTREGA ADD CONSTRAINT RADIO_ENTREGA_DELIVERY_FK FOREIGN KEY ( ID_DELIVERY ) REFERENCES DELIVERY ( ID_DELIVERY ) ;

ALTER TABLE SUCURSAL ADD CONSTRAINT SUCURSAL_CASA_CENTRAL_FK FOREIGN KEY ( ID_CASA_CENT ) REFERENCES CASA_CENTRAL ( ID_CASA_CENT ) ;

ALTER TABLE SUCURSAL ADD CONSTRAINT SUCURSAL_CIUDAD_FK FOREIGN KEY ( ID_CIUDAD ) REFERENCES CIUDAD ( ID_CIUDAD ) ;

ALTER TABLE TC ADD CONSTRAINT TC_CLIENTE_FK FOREIGN KEY ( ID_CLIENTE ) REFERENCES CLIENTE ( ID_CLIENTE ) ;

ALTER TABLE TC ADD CONSTRAINT TC_EMISOR_TC_FK FOREIGN KEY ( ID_EMISOR ) REFERENCES EMISOR_TC ( ID_EMISOR ) ;


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            29
-- CREATE INDEX                             4
-- ALTER TABLE                             57
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
