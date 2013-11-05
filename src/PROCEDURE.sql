DROP PROCEDURE IF EXISTS InsertNomenklatura 
CREATE PROCEDURE InsertNomenklatura(IN product_name VARCHAR (50), IN weight FLOAT, IN volume FLOAT, IN category_id INT (11), IN creator_id INT (11), IN price FLOAT)
BEGIN
  DECLARE counts     INT DEFAULT 0;
  DECLARE PRODUCT_ID INT DEFAULT 0;

  SELECT
    COUNT(*)
  INTO
    counts
  FROM
    product p
  WHERE
    p.product_name = product_name;

  IF (NOT(creator_id IS NULL)) THEN
    IF (counts = 0) THEN
      INSERT INTO product (product.weight, product.product_name, product.volume, product.category_id) VALUES (weight, product_name, volume, category_id);
      SELECT
        LAST_INSERT_ID()
      INTO
        PRODUCT_ID;
      INSERT INTO nomenklatura (nomenklatura.creator_id, nomenklatura.product_id, nomenklatura.price) VALUES (creator_id, PRODUCT_ID, price);
    END IF;
  END IF;
END;
