use pizzahut;

show tables;

select * from order_details;
select * from orders;
select * from pizza_types;
select * from pizzas;

SELECT 
    pizza_types.category,
    ROUND((ROUND(SUM(order_details.quantity * pizzas.price),
                    2) / (SELECT 
                    ROUND(SUM(order_details.quantity * pizzas.price),
                                2) AS revenue
                FROM
                    pizza_types
                        JOIN
                    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
                        JOIN
                    order_details ON order_details.pizzaid = pizzas.pizza_id)) * 100,
            0) AS Total_revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizzaid = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY Total_revenue DESC;


-- Analyze the cummmulative revenue generated over time 

select order_date,SUM(revenue) over (order by order_date) as cum_revenue from
(SELECT 
    orders.order_date,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizzas
        JOIN
    order_details ON order_details.pizzaid = pizzas.pizza_id
        JOIN
    orders ON orders.orderid = order_details.orderid
GROUP BY orders.order_date) as Sales;

-- determine the top 3 pizza category by revenue for each pizza catgory 
select name,revenue from
(select category,name,revenue,rank() over (partition by category order by revenue desc) as rn from 
(SELECT 
    pizza_types.category,
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizzaid = pizzas.pizza_id
GROUP BY pizza_types.category , pizza_types.name) as a) as b where rn <= 3;