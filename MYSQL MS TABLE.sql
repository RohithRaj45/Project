create schema UserDB;
use UserDB;

create table buyer(
buyerid INTEGER,
name VARCHAR2(30),
email VARCHAR(15),
phonenumber NUMBER(10),
password VARCHAR2(20),
isprivileged CHAR(1) CONSTRAINT buy_is_privileged CHECK(isprivileged IN ('Y','N')),
rewardpoints NUMBER,
isactive CHAR(1) CONSTRAINT buy_is_active CHECK(isactive IN ('Y','N')),
CONSTRAINT buy_cid_pk PRIMARY KEY(buyerid)
);

create table seller(
sellerid INTEGER,
name VARCHAR2(30),
email VARCHAR(15),
phonenumber NUMBER(10),
password VARCHAR2(20),
isactive CHAR(1) CONSTRAINT buy_is_active CHECK(isactive IN ('Y','N'))
);

create table wishlist(
prodid NUMBER,
buyerid NUMBER,
CONSTRAINT wishlist_cid_pk PRIMARY KEY(prodid,buyerid)
);

create table cart(
prodid INTEGER,
buyerid INTEGER,
quantity INTEGER,
CONSTRAINT cart_cid_pk PRIMARY KEY(prodid,buyerid)
);


create schema ProductDB;
use ProductDB;

create table Product(
prodid INTEGER,
productname VARCHAR2(30),
price NUMBER,
stock NUMBER,
description VARCHAR2(60),
image BLOB,
sellerid INTEGER,
category VARCHAR2(20),
subcategory VARCHAR2(20),
productrating VARCHAR2(20)
);

create table subscribedproduct(
prodid INTEGER,
buyerid INTEGER,
quantity INTEGER,
CONSTRAINT cart_cid_pk PRIMARY KEY(prodid,buyerid)
);

create schema OrderDB;
use OrderDB;

create table order(
orderid INTEGER,
buyerid INTEGER,
amount NUMBER,
orderdate DATE,
address VARCHAR2(50),
status VARCHAR2(10)
);

create table productsordered(
prodid INTEGER,
buyerid INTEGER,
sellerid INTEGER,
quantity INTEGER,
CONSTRAINT cart_cid_pk PRIMARY KEY(prodid,buyerid)
);