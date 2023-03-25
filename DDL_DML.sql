select * from customer
select * from orders
select * from payment
select * from product
select * from credit_card



--Question 1 (Find the highest and lowest priced products along with their prices)
select product_name, min(unit_price), max(unit_price)
from product
group by product_name
;


--Question 2 (Find the total number of orders in each month in the year)
select extract('MONTH' from order_date) as order_month,
count(extract('MONTH' from order_date)) as orders_per_month
from orders
group by extract('MONTH' from order_date);


--Question 3 (Find the average unit price and unit cost(2 decimals) for each product category)
select product_category, 
round(avg(unit_price), 2) as AVG_price, 
round(avg(unit_cost), 2) as AVG_cost
from product
group by product_category
order by avg(unit_cost) desc;


--Question 4a (Find all orders that were placed on or after August 1 2022)
select * from orders
where order_date > '2022-08-01';


--Question 4b (Find and count all orders that were placed on or after August 1 2022)
select order_date, count(order_date) as num_of_orders
from orders
where order_date > '2022-08-01'
group by order_date
order by order_date desc;


--Question 5 (Count the number of payments made on April 14, 2023)
select count(payment_date) as num_of_payments
from payment
where payment_date = '2023-04-14'
;


--Question 6 (Which customer_id has the highest orders placed in the order table)
select customer_id, quantity
from orders
order by quantity desc;

--Question 7a (What is the total number of orders made by each customer_id)
select customer_id, count(quantity) as total_num_of_orders
from orders
group by customer_id
order by total_num_of_orders desc;


--Question 7b (What is the total sum of items purchased by each customer)
select customer_id, sum(quantity) as sum_of_orders
from orders
group by customer_id
order by sum_of_orders desc;


--Question 8 (How many orders were delivered between Jan and Feb 2023)
select order_date, count(order_date) as num_of_orders
from orders
where order_date between '2023-01-01' and '2023-02-01'
group by order_date;


--Question 9 (Add a credit card table to the exercise1 DB and populate the data for all customers
--Ensure that it is linked to one of the 4 tables. See table columns (card_number, customer_id, card_expiry_date, bank_name)
create table credit_card (
	card_id int primary key,  
	customer_id bigint,
	card_number bigint not null,
	card_expiry_date date not null, 
	bank_name VARCHAR(50) not null, 
	foreign key (customer_id) references customer(customer_id)
);


--Question 10a (Retrieve all the information associated with the credit card that is next to expire from the credit card table)
select *
from credit_card
where card_expiry_date > '2023-03-25';


--Question 10b (How many have expired)
select count(card_expiry_date) no_of_expired_cards
from credit_card
where card_expiry_date < '2023-03-25'
;
