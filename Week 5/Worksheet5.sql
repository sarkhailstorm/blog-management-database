CREATE TABLE product (prod_id SERIAL PRIMARY KEY, prod_name VARCHAR(30) NOT NULL, prod_desc TEXT NOT NULL, prod_price DECIMAL(6,2) NOT NULL);
CREATE TABLE category (cat_id SERIAL PRIMARY KEY, cat_name VARCHAR(50) NOT NULL, cat_desc TEXT NOT NULL);
CREATE TABLE prodCat (prod_id INT, cat_id INT, PRIMARY KEY (prod_id, cat_id), FOREIGN KEY (prod_id) REFERENCES product (prod_id), FOREIGN KEY (cat_id) REFERENCES category (cat_id));

INSERT INTO category (cat_name, cat_desc) VALUES ('kids wear', 'clothes suitable for your children or for very small adults'), ('household', 'everything to make a house a home.');
INSERT INTO product (prod_name, prod_desc, prod_price) VALUES ('baseball cap', 'a one size fits all baseball cap. Can be worn back to front if desired.', 4.99), ('bathroom towel', 'the loveliest, fluffiest towels you could desire. Go on, pamper yourself!', 7.98);

INSERT INTO prodCat (prod_id, cat_id) VALUES (1,1);
INSERT INTO prodCat (prod_id, cat_id) VALUES (2,2);