ALTER TABLE `b57`.`nomenklatura`
  ADD COLUMN `PriceDate` DATE DEFAULT 0 NOT NULL AFTER `product_id`,
  DROP PRIMARY KEY,
  ADD PRIMARY KEY USING BTREE (`creator_id`, `product_id`, `PriceDate`);

DROP TABLE IF EXISTS zakaz_details_test;

CREATE TABLE zakaz_details_test(
  creator_id INT (11) NOT NULL,
  zakaz_id INT (11) NOT NULL,
  count FLOAT DEFAULT NULL,
  price FLOAT DEFAULT NULL,
  transport_id INT (11) DEFAULT 0,
  product_id INT (11) NOT NULL,
  priceDate DATE DEFAULT 0,
  position INT (11) NOT NULL DEFAULT 0,
  PRIMARY KEY (creator_id, zakaz_id, product_id, priceDate)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

INSERT INTO zakaz_details_test
SELECT creator_id, zakaz_id, count, price, transport_id, product_id, 0, position
FROM zakaz_details;


DROP TABLE IF EXISTS zakaz_details;

CREATE TABLE zakaz_details(
  creator_id INT (11) NOT NULL,
  zakaz_id INT (11) NOT NULL,
  count FLOAT DEFAULT NULL,
  price FLOAT DEFAULT NULL,
  transport_id INT (11) DEFAULT 0,
  product_id INT (11) NOT NULL,
  priceDate DATE DEFAULT 0,
  position INT (11) NOT NULL DEFAULT 0,
  PRIMARY KEY (creator_id, zakaz_id, product_id, priceDate),
  INDEX R_9 USING BTREE (creator_id, product_id, priceDate),
  INDEX R_10 USING BTREE (zakaz_id),
  INDEX R_11 USING BTREE (transport_id),
  CONSTRAINT zakaz_details_ibfk_1 FOREIGN KEY (creator_id, product_id, priceDate)
  REFERENCES b57.nomenklatura (creator_id, product_id, priceDate),
  CONSTRAINT zakaz_details_ibfk_2 FOREIGN KEY (zakaz_id)
  REFERENCES b57.zakaz (zakaz_id) ON DELETE CASCADE,
  CONSTRAINT zakaz_details_ibfk_3 FOREIGN KEY (transport_id)
  REFERENCES b57.transport (transport_id)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;


-- Заявки и акты 

CREATE TABLE zayavka(
  zayavka_id INTEGER NULL,
  CreateDate DATE NULL,
  person_zayavka VARCHAR (20) NULL
)
;

ALTER TABLE zayavka
  ADD PRIMARY KEY (zayavka_id)
;



CREATE TABLE zakaz_details_zayavka(
  creator_id INTEGER NOT NULL,
  zakaz_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  priceDate DATE NOT NULL,
  zayavka_id INTEGER NOT NULL,
  position INTEGER NULL,
  count INTEGER NULL
)
;



ALTER TABLE zakaz_details_zayavka
  ADD PRIMARY KEY (creator_id, zakaz_id, product_id, priceDate, zayavka_id)
;



CREATE TABLE akt(
  akt_id INTEGER NULL
)
;



ALTER TABLE akt
  ADD PRIMARY KEY (akt_id)
;



CREATE TABLE zayavka_akt(
  creator_id INTEGER NOT NULL,
  zakaz_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  priceDate DATE NOT NULL,
  zayavka_id INTEGER NOT NULL,
  akt_id INTEGER NOT NULL,
  is_complete INTEGER NULL
)
;



ALTER TABLE zayavka_akt
  ADD PRIMARY KEY (creator_id, zakaz_id, product_id, priceDate, zayavka_id, akt_id)
;

ALTER TABLE zakaz_details_zayavka
  ADD FOREIGN KEY R_16 (creator_id, zakaz_id, product_id, priceDate) REFERENCES zakaz_details (creator_id, zakaz_id, product_id, priceDate)
;


ALTER TABLE zakaz_details_zayavka
  ADD FOREIGN KEY R_17 (zayavka_id) REFERENCES zayavka (zayavka_id)
;



ALTER TABLE zayavka_akt
  ADD FOREIGN KEY R_19 (creator_id, zakaz_id, product_id, priceDate, zayavka_id) REFERENCES zakaz_details_zayavka (creator_id, zakaz_id, product_id, priceDate, zayavka_id)
;


ALTER TABLE zayavka_akt
  ADD FOREIGN KEY R_20 (akt_id) REFERENCES akt (akt_id)
;



