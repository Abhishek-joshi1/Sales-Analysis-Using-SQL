create database PizzaHut;

use PizzaHut;

select * from pizzas;

create table orders(
    orderid int Primary Key Not Null,
    order_date datetime Not Null,
    order_time time Not Null
);

select * from orders;

create table order_details(
    order_detailsid int NOT NULL,
    orderid int NOT NULL,
    pizzaid text NOT NULL,
    quantity int NOT NULL,
    primary key(order_detailsid)
);

select * from order_details;

select * from pizza_types;

select * from pizzas;

select count(*) as Total_Order from orders;

SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) as Total_Revenue 
FROM
    order_details
        JOIN
    pizzas ON order_details.pizzaid = pizzas.pizza_id;
    
-- Identify the highest priced pizza 

SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1; 

-- Indentify the most common pizza size ordered 

SELECT 
    pizzas.size,
    COUNT(order_details.order_detailsid) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizzaid
GROUP BY pizzas.size
ORDER BY order_count DESC
LIMIT 1;

-- List the five most ordered pizzas along with their quantity

SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizzaid = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;
-- order by quantityS






