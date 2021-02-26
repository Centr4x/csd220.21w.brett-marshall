use classicmodels;

select orderNumber, orderDate 
from orders 
order by orderDate limit 3;

select productName 
from products 
order by quantityInStock desc limit 1 offset 1;

select orderNumber, requiredDate 
from orders 
where status = 'In Process' 
order by orderDate desc;

select distinct status, count(*) 
from orders 
group by status 
order by count(*) desc;

select productLine, group_concat( distinct productName order by productName separator ';') as products 
from products 
group by productLine ;

select year(paymentDate) as `year`, ROUND(AVG(amount), 2) as 'average payments', ROUND(sum(amount), 2) as `total payments` 
from payments 
group by year(paymentDate);

select productLine, count(*) as `products_in_productsline`
from products 
where quantityInStock < 500
group by productLine
having `products_in_productsline` > 1
;

select customerNumber, count(distinct orderNumber) as `orders_shipped`
from orders 
where (year(orderDate) = 2004) and (status = 'shipped')
group by customerNumber
having `orders_shipped` >= 5
order by `orders_shipped` desc
;