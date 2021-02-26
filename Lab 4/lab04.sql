use classicmodels;

select distinct orders.customerNumber, customerName, sum(orderdetails.quantityOrdered*orderdetails.priceEach) as total
from customers
join orders on orders.customerNumber = customers.customerNumber 
join orderdetails on orders.orderNumber = orderdetails.orderNumber
group by orders.customerNumber
order by total desc
;

-- rounded to 2 decimal points
select distinct orders.customerNumber, customerName, round(avg(orderdetails.quantityOrdered*orderdetails.priceEach),2) as average_total
from customers
join orders on orders.customerNumber = customers.customerNumber 
join orderdetails on orders.orderNumber = orderdetails.orderNumber
group by orders.customerNumber
order by average_total desc
;

select productName, buyPrice 
from products
where buyPrice in (select max(buyPrice) from products)
;

select productCode 
from products
where buyPrice in (select max(buyPrice) from products)
;

select customers.customerName 
from products
join orderdetails on orderdetails.productCode = products.productCode
join orders on orders.orderNumber = orderdetails.orderNumber 
;