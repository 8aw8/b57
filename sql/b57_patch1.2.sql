
CREATE TABLE logistiks(
  avto_id INTEGER NOT NULL,
  dispetcher_id INTEGER NOT NULL,
  avto_driver_id INTEGER NOT NULL,
  zakaz_id INTEGER NOT NULL,
  point_from CHAR (32) NULL,
  point_to CHAR (32) NULL,
  price_avto FLOAT NULL,
  price_dispatcher INTEGER NULL
)
;



ALTER TABLE logistiks
  ADD PRIMARY KEY (avto_id, dispetcher_id, avto_driver_id, zakaz_id)
;



CREATE TABLE Dispetcher(
  dispetcher_id INTEGER NULL,
  name_disp CHAR (80) NULL,
  tel_disp CHAR (21) NULL
)
;



ALTER TABLE Dispetcher
  ADD PRIMARY KEY (dispetcher_id)
;



CREATE TABLE avto(
  avto_id INTEGER NOT NULL,
  avto_owner_id INTEGER NULL,
  avto_number CHAR (10) NULL,
  mark_avto CHAR (20) NULL,
  peregruz INTEGER NULL,
  tonag FLOAT NULL
)
;



ALTER TABLE avto
  ADD PRIMARY KEY (avto_id)
;



CREATE TABLE avto_owner(
  avto_owner_id INTEGER NULL,
  tel_owner CHAR (21) NULL,
  name_owner CHAR (64) NULL
)
;



ALTER TABLE avto_owner
  ADD PRIMARY KEY (avto_owner_id)
;



CREATE TABLE avto_driver(
  avto_driver_id INTEGER NULL,
  name_driver CHAR (64) NULL,
  address CHAR (32) NULL,
  tel_driver CHAR (21) NULL
)
;



ALTER TABLE avto_driver
  ADD PRIMARY KEY (avto_driver_id)
;



ALTER TABLE logistiks
  ADD FOREIGN KEY R_28 (avto_id) REFERENCES avto (avto_id)
;


ALTER TABLE logistiks
  ADD FOREIGN KEY R_29 (dispetcher_id) REFERENCES Dispetcher (dispetcher_id)
;


ALTER TABLE logistiks
  ADD FOREIGN KEY R_30 (avto_driver_id) REFERENCES avto_driver (avto_driver_id)
;


ALTER TABLE logistiks
  ADD FOREIGN KEY R_32 (zakaz_id) REFERENCES zakaz (zakaz_id)
;



ALTER TABLE avto
  ADD FOREIGN KEY R_27 (avto_owner_id) REFERENCES avto_owner (avto_owner_id)
;


