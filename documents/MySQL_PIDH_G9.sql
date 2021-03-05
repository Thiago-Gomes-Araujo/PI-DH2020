-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-03-03 22:23:54.28

-- tables
-- Table: city
CREATE TABLE city (
    id int NOT NULL AUTO_INCREMENT,
    city_name varchar(128) NOT NULL,
    country_id int NOT NULL,
    CONSTRAINT city_pk PRIMARY KEY (id)
);

-- Table: client
CREATE TABLE client (
    id int NOT NULL AUTO_INCREMENT,
    first_name varchar(128) NOT NULL,
    last_name varchar(128) NOT NULL,
    company_name varchar(128) NULL,
    VAT_ID varchar(64) NULL,
    city_id int NOT NULL,
    client_address text NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (id)
);

-- Table: country
CREATE TABLE country (
    id int NOT NULL AUTO_INCREMENT,
    country_name varchar(128) NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY (id)
);

-- Table: payment_data
CREATE TABLE payment_data (
    id int NOT NULL AUTO_INCREMENT,
    payment_type_id int NOT NULL,
    data_name varchar(255) NOT NULL,
    data_type varchar(255) NOT NULL,
    UNIQUE INDEX payment_data_ak_1 (payment_type_id,data_name),
    CONSTRAINT payment_data_pk PRIMARY KEY (id)
);

-- Table: payment_details
CREATE TABLE payment_details (
    id int NOT NULL AUTO_INCREMENT,
    payment_data_id int NOT NULL,
    value varchar(255) NOT NULL,
    client_id int NOT NULL,
    product_id int NOT NULL,
    CONSTRAINT payment_details_pk PRIMARY KEY (id)
);

-- Table: payment_type
CREATE TABLE payment_type (
    id int NOT NULL AUTO_INCREMENT,
    type_name varchar(64) NOT NULL,
    CONSTRAINT payment_type_pk PRIMARY KEY (id)
) COMMENT 'e.g. card, cash, paypal, wire transfer';

-- Table: product
CREATE TABLE product (
    id int NOT NULL AUTO_INCREMENT,
    product_name varchar(64) NOT NULL,
    product_description varchar(255) NOT NULL,
    product_type_id int NOT NULL,
    price decimal(8,2) NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY (id)
);

-- Table: product_type
CREATE TABLE product_type (
    id int NOT NULL AUTO_INCREMENT,
    type_name varchar(64) NOT NULL,
    CONSTRAINT product_type_pk PRIMARY KEY (id)
);

-- views
-- View: product_details
CREATE VIEW product_details AS
SELECT
  p.id,
  p.product_name,
  p.product_description,
  pt.type_name,
  p.price,
  s.last_update_time
FROM product p
LEFT JOIN product_type pt ON p.product_type_id = pt.id
LEFT JOIN stock s ON p.id = s.product_id;

-- foreign keys
-- Reference: city_country (table: city)
ALTER TABLE city ADD CONSTRAINT city_country FOREIGN KEY city_country (country_id)
    REFERENCES country (id);

-- Reference: client_city (table: client)
ALTER TABLE client ADD CONSTRAINT client_city FOREIGN KEY client_city (city_id)
    REFERENCES city (id);

-- Reference: payment_data_payment_type (table: payment_data)
ALTER TABLE payment_data ADD CONSTRAINT payment_data_payment_type FOREIGN KEY payment_data_payment_type (payment_type_id)
    REFERENCES payment_type (id);

-- Reference: payment_details_client (table: payment_details)
ALTER TABLE payment_details ADD CONSTRAINT payment_details_client FOREIGN KEY payment_details_client (client_id)
    REFERENCES client (id);

-- Reference: payment_details_payment_data (table: payment_details)
ALTER TABLE payment_details ADD CONSTRAINT payment_details_payment_data FOREIGN KEY payment_details_payment_data (payment_data_id)
    REFERENCES payment_data (id);

-- Reference: payment_details_product (table: payment_details)
ALTER TABLE payment_details ADD CONSTRAINT payment_details_product FOREIGN KEY payment_details_product (product_id)
    REFERENCES product (id);

-- Reference: product_product_type (table: product)
ALTER TABLE product ADD CONSTRAINT product_product_type FOREIGN KEY product_product_type (product_type_id)
    REFERENCES product_type (id);

-- End of file.

