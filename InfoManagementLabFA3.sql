create table customer
(
    customer_ID		             number(11)    primary key,
    customer_lname 	           varchar2(100) not null,
    customer_fname             varchar2(100) not null
)

create table item
(
    item_ID                    number(11)    primary key,
    item_name 	       	       varchar2(100) not null,
    item_quantity              varchar2(100) not null check(item_quantity >= 0)
)

create table orders
(
    orders_ID                    number(11)    primary key,
    orders_date  	       	       date,
    orders_customer_ID           number(11)    not null,

    constraint orders_customer_fk foreign key(orders_customer_ID) references customer(customer_ID)
)

create table product
(
    product_ID                   number(11)    primary key,
    product_category 	       	   varchar2(500) not null,
)

create table item_product
(
    IP_item_ID		               number(11)    primary key,
    IP_product_ID 	             number(11) not null,

    constraint used_item_fk foreign key(IP_item_ID) references item(item_ID),
    constraint used_product_fk foreign key(IP_product_ID) references product(product_ID)
)


--


CREATE TABLE REQUESTS
(
  R_ORDER_ID           NUMBER(11)        NOT NULL,
  R_PRODUCT_ID          NUMBER(11)        NOT NULL,

  CONSTRAINT REQUESTS_ORDER_FK FOREIGN KEY(R_ORDER_ID) REFERENCES orders(orders_ID),
  CONSTRAINT REQUESTS_PRODUCT_FK FOREIGN KEY(R_PRODUCT_ID) REFERENCES product(product_ID)
);

CREATE TABLE SUPPLIER
(
  S_ID                  VARCHAR2(100)     PRIMARY KEY,
  S_NAME                VARCHAR2(350)     NOT NULL,
)

CREATE TABLE SHIPMENT
(
  S_SHIPMENT_NO         NUMERIC(11)       PRIMARY KEY,
  S_SHIPMENT_DATE       DATE,
  S_COURIER             VARCHAR2(250)     NOT NULL,
  S_SUPPLIER_ID         VARCHAR(100)      NOT NULL,

  CONSTRAINT SHIPMENT_SUPPLIER_FK FOREIGN KEY(S_SUPPLIER_ID) REFERENCES SUPPLIER(S_ID)
);

CREATE TABLE SHIPMENT_ITEM
(
  SI_SHIPMENT_NO        NUMBER(11)        PRIMARY KEY,
  SI_ITEM_ID            NUMBER(11)        NOT NULL,

  CONSTRAINT INCLUDES_SHIPMENT_FK FOREIGN KEY(SI_SHIPMENT_NO) REFERENCES SHIPMENT(S_SHIPMENT_NO),
  CONSTRAINT INCLUDES_ITEM_FK FOREIGN KEY(SI_ITEM_ID) REFERENCES item(item_ID)
);


CREATE TABLE SUPPLIER_ITEM
(
  SUI_SUPPLIER_ID       VARCHAR2(100)     PRIMARY KEY,
  SUI_ITEM_ID           NUMBER(11)        NOT NULL,

  CONSTRAINT SUPPLIES_SUPPLIER_FK FOREIGN KEY(SUI_SUPPLIER_ID) REFERENCES SUPPLIER(S_ID),
  CONSTRAINT SUPPLIES_ITEM_FK FOREIGN KEY(SUI_ITEM_ID) REFERENCES item(item_ID)
);
