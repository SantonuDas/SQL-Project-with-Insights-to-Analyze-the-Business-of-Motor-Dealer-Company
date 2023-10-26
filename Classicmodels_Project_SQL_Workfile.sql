use classicmodels

										   #### INSIGHTS ####
## || Product Category wise Revenue ||
select distinct(productLine) as product_category,sum(quantityOrdered*priceEach) as Total_revenue
from products
inner join orderdetails
on products.productCode=orderdetails.productCode
inner join orders 
on orderdetails.orderNumber=orders.orderNumber
group by productLine

## || Top 5 Most Revenue Generated Customers ||
select customerName,sum(quantityOrdered*priceEach) as Total_revenue
from customers
inner join orders 
on customers.customerNumber=orders.customerNumber
inner join orderdetails
on orders.orderNumber=orderdetails.orderNumber
group by customerName order by Total_revenue desc
limit 5

## || Total Sales over the given period of time ||
select customerNumber,sum(quantityOrdered*priceEach) as Total_amount from orders
inner join orderdetails
on orders.orderNumber=orderdetails.orderNumber
group by customerNumber

## || Top 10 Most Popular Product Brands ||
select productName,sum(quantityOrdered) from products
inner join orderdetails
on products.productCode=orderdetails.productCode
group by productName order by sum(quantityOrdered) desc
limit 10

## || Most Ordered/Sales of product vs Most Profit Gained by a Product ||
select distinct(productCode),sum(quantityOrdered) from orderdetails 
group by productCode order by sum(quantityOrdered) desc

     #### Most Ordered Products ####
select products.productCode,sum(quantityOrdered),sum(MSRP),sum(priceEach) as salePrice,
sum(buyPrice) as costPrice from orderdetails
inner join products
on orderdetails.productCode=products.productCode
group by products.productCode order by sum(quantityOrdered) desc

     #### Most Profit Gained Products ####
select products.productCode,sum(quantityOrdered),sum(MSRP),sum(priceEach) as salePrice,
sum(buyPrice) as costPrice,(sum(priceEach)-sum(buyPrice))as profit from orderdetails
inner join products
on orderdetails.productCode=products.productCode
group by products.productCode order by profit desc

## || Top 10 Most Revenue Generated Countries ||
select country,sum(quantityOrdered*priceEach) as total_revenue from customers
inner join orders
on customers.customerNumber=orders.customerNumber
inner join orderdetails
on orders.orderNumber=orderdetails.orderNumber
group by country order by total_revenue desc
limit 10

