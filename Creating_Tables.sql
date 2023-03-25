CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR (255) not null,
  email VARCHAR (255) not null,
  phone VARCHAR (20) not null
);
  
  select * from customer;
  
CREATE TABLE product (
  product_id INT PRIMARY KEY,
  product_name VARCHAR (255) not null,
  description TEXT,
  product_category VARCHAR (50) not null,
  unit_price DECIMAL (10,2) not null
);

select * from product;


CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE not null,
  product_id INT,
  quantity INT not null,
  delivery_status VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

select * from orders;

CREATE TABLE payment (
  payment_id INT PRIMARY KEY,
  order_id INT,
  payment_date DATE not null,
  FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

select * from payment;

