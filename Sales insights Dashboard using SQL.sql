use chaithanya;

# 1.Create Tables

create table customers
(
customer_id int primary key,
name varchar(50),
region varchar(50)
);

create table products
(
product_id int primary key,
product_name varchar(50),
category varchar(50),
price decimal (10,2)
);

create table sales
(
sales_id int primary key,
customer_id int,
product_id int,
quantity int,
sales_date date,
foreign key (customer_id) references customers(customer_id),
foreign key (product_id) references products(product_id)
);

# 2. Insert sample data
insert into customers (customer_id, name, region)
values
 (1, 'Ramesh Kumar', 'south'),
 (2, 'Priya Sharma', 'North'),
 (3, 'Anil Singh', 'West');
 
 insert into products (product_id,product_name,category,price)
 values
 (101, 'Laptop', 'Electronics', 50000),
 (102, 'Mobie', 'Electronics', 20000),
 (103, 'Headphones', 'Accessories', 2000);
 
 insert into sales (sales_id,customer_id,product_id,quantity,sales_date)
 values
 (1,1,101,1,'2025-08-01'),
 (2,2,102,1,'2025-08-02'),
 (3,3,103,5,'2025-08-02'),
 (4,1,102,1,'2025-08-03');
 
 select*from customers;
 select*from products;
 select*from sales;
 
 # 3. Find Total Revenue
 
 select sum(s.quantity*p.price) AS total_revenue
 from sales s
 join products p ON s.product_id=p.product_id;
 
 # 4.Top Selling Product
 
 select p.product_name, sum(s.quantity) AS total_sold
 from sales s
 join products p ON s.product_id=p.product_id
 group by p.product_name
 order by total_sold desc
 limit 1;

# 5.sales by region

select c.region, sum(s.quantity*p.price) AS region_revenue
from sales s
join customers c on s.customer_id=c.customer_id
join products p on s.product_id=p.product_id
group by c.region
order by region_revenue desc;

# 6.Daily sales trend

select sales_date,sum(s.quantity*p.price) AS daily_revenue
from sales s
join products p on s.product_id=p.product_id
group by sales_date
order by sales_date;



 