# Sales-Analysis-Using-SQL
This project involves analyzing pizza sales data to derive meaningful insights and drive strategic decisions. Below is a breakdown of the different analyses conducted at various levels of complexity: Basic, Intermediate, and Advanced.

Basic Analyses
Retrieve the total number of orders placed: Count the total number of entries in the Orders table to determine how many orders were made.
Calculate the total revenue generated from pizza sales: Sum the product of quantity and price for all items in the OrderDetails table to get the total revenue.
Identify the highest-priced pizza: Query the Pizzas table to find the pizza with the highest price.
Identify the most common pizza size ordered: Aggregate and count the pizza sizes in the OrderDetails and Pizzas tables to find the most frequently ordered size.
List the top 5 most ordered pizza types along with their quantities: Join the OrderDetails and Pizzas tables, then group by pizza type and sum the quantities to list the top 5.
Intermediate Analyses
Join the necessary tables to find the total quantity of each pizza category ordered: Integrate the Orders, OrderDetails, and Pizzas tables and aggregate the quantities by pizza category.
Determine the distribution of orders by hour of the day: Extract the hour from order times in the Orders table and count the number of orders for each hour.
Join relevant tables to find the category-wise distribution of pizzas: Combine the OrderDetails and Pizzas tables, then group by pizza category and sum the quantities.
Group the orders by date and calculate the average number of pizzas ordered per day: Aggregate order data by date in the Orders and OrderDetails tables and compute the daily average.
Determine the top 3 most ordered pizza types based on revenue: Sum the revenue for each pizza type by joining the OrderDetails and Pizzas tables, then rank and select the top 3.
Advanced Analyses
Calculate the percentage contribution of each pizza type to total revenue: Determine the revenue for each pizza type and divide it by the total revenue to find its percentage contribution.
Analyze the cumulative revenue generated over time: Sum the revenues cumulatively by date to analyze revenue growth over time.
Determine the top 3 most ordered pizza types based on revenue for each pizza category: Rank pizza types within each category by revenue and select the top 3 from each category.
Data Tables
Orders: Contains details of each order, including order ID, date, and time.
OrderDetails: Provides itemized details of each order, including pizza ID, quantity, and price.
Pizzas: Contains information about each pizza, such as name, category, size, and price.
Usage
To replicate the analyses, ensure you have the database setup with the appropriate tables and data. Use the provided SQL queries to perform the analyses as outlined.

Conclusion
This project demonstrates the use of SQL to extract valuable insights from pizza sales data, helping to optimize business operations and improve decision-making processes.
