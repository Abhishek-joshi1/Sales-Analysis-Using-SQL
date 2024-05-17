select * from orders;

select * from order_details;

select * from pizza_types;

select * from pizzas;

-- Join the necessary tables to find the 
-- total quantity of each pizza category ordered 

SELECT 
    pizza_types.category, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizzaid = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;

-- determine th edistribution of order by hour of the day 
SELECT 
    HOUR(order_time) AS hour, COUNT(orderid) AS Order_count
FROM
    orders
GROUP BY HOUR(order_time);   

-- Join the relevant tables to find the category wise distribution of pizzas 

SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;


-- Find out the average quantity of pizza ordered per day 
SELECT 
    ROUND(AVG(Quantity), 0) AS Average_Qunaitity_Per_Day
FROM
    (SELECT 
        order_date AS Day, SUM(order_details.quantity) AS Quantity
    FROM
        orders
    JOIN order_details ON orders.orderid = order_details.orderid
    GROUP BY orders.order_date) AS Order_quantity; 
    
--     Determine the top 3 pizza ordered according to revenue 

SELECT 
    pizza_types.name,
    SUM(pizzas.price * order_details.quantity) AS Revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizzaid = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY Revenue DESC
LIMIT 3; 