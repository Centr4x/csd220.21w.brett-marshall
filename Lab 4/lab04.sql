use classicmodels;

-- Question 1
select
	distinct orders.customerNumber,
	customerName,
	sum(orderdetails.quantityOrdered*orderdetails.priceEach) as total
from
	customers
join orders on
	orders.customerNumber = customers.customerNumber
join orderdetails on
	orders.orderNumber = orderdetails.orderNumber
group by customers.customerNumber 
order by
	total desc ;

-- Question 2
-- rounded to 2 decimal points
select round(avg(testtable.total), 2) as average_total
from (select
	distinct orders.customerNumber,
	customerName,
	sum(orderdetails.quantityOrdered*orderdetails.priceEach) as total
from
	customers
join orders on
	orders.customerNumber = customers.customerNumber
join orderdetails on
	orders.orderNumber = orderdetails.orderNumber
group by
	orders.customerNumber
order by
	total desc) as testtable;


-- Question 3
 select
	productName,
	buyPrice
from
	products
where
	buyPrice in (
	select
		max(buyPrice)
	from
		products) ;
	
-- Question 4
 select
	distinct orders.customerNumber,
	customers.customerName as expensivetaste
from
	orderdetails
join products on
	products.productCode = orderdetails.productCode
join orders on
	orders.orderNumber = orderdetails.orderNumber
join customers on
	customers.customerNumber = orders.customerNumber
where
	buyPrice in (
	select
		max(buyPrice)
	from
		products) ;

-- Question 5
select
	testtable.customerNumber,
	testtable.expensivetaste,
	sum(orderdetails.quantityOrdered*orderdetails.priceEach) as total
from
	(
	select
		distinct orders.customerNumber, customers.customerName as expensivetaste
	from
		orderdetails
	join products on
		products.productCode = orderdetails.productCode
	join orders on
		orders.orderNumber = orderdetails.orderNumber
	join customers on
		customers.customerNumber = orders.customerNumber
	where
		buyPrice in (
		select
			max(buyPrice)
		from
			products) ) as testtable
join orders on
	orders.customerNumber = testtable.customerNumber
join orderdetails on
	orderdetails.orderNumber = orders.orderNumber
group by
	testtable.customerNumber
order by
	total desc ;

-- Question 6

select
	testtable.customerNumber,
	testtable.expensivetaste,
	sum(orderdetails.quantityOrdered*orderdetails.priceEach) as total
from
	(
	select
		distinct orders.customerNumber, customers.customerName as expensivetaste
	from
		orderdetails
	join products on
		products.productCode = orderdetails.productCode
	join orders on
		orders.orderNumber = orderdetails.orderNumber
	join customers on
		customers.customerNumber = orders.customerNumber
	where
		buyPrice in (
		select
			max(buyPrice)
		from
			products) ) as testtable
join orders on
	orders.customerNumber = testtable.customerNumber
join orderdetails on
	orderdetails.orderNumber = orders.orderNumber
group by
	testtable.customerNumber
having
	total > (
	select
		round(avg(testtable.total), 2) as average_total
	from
		(
		select
			distinct orders.customerNumber, customerName, sum(orderdetails.quantityOrdered*orderdetails.priceEach) as total
		from
			customers
		join orders on
			orders.customerNumber = customers.customerNumber
		join orderdetails on
			orders.orderNumber = orderdetails.orderNumber
		group by
			orders.customerNumber
		order by
			total desc) as testtable )
order by
	total desc ;

-- Question 7

create or replace view expensiveTasteCustomers as
 select
	distinct orders.customerNumber,
	customers.customerName as expensivetaste
from
	orderdetails
join products on
	products.productCode = orderdetails.productCode
join orders on
	orders.orderNumber = orderdetails.orderNumber
join customers on
	customers.customerNumber = orders.customerNumber
where
	buyPrice in (
	select
		max(buyPrice)
	from
		products) ;
		
select
	expensiveTasteCustomers.customerNumber,
	expensiveTasteCustomers.expensivetaste,
	sum(orderdetails.quantityOrdered*orderdetails.priceEach) as total
from
	expensiveTasteCustomers
join orders on
	orders.customerNumber = expensiveTasteCustomers.customerNumber
join orderdetails on
	orderdetails.orderNumber = orders.orderNumber
group by
	expensiveTasteCustomers.customerNumber
order by
	total desc ;
	
-- Question 8 
create or replace view purchaseTotal as 
select
	distinct orders.customerNumber,
	customerName,
	sum(orderdetails.quantityOrdered*orderdetails.priceEach) as total
from
	customers
join orders on
	orders.customerNumber = customers.customerNumber
join orderdetails on
	orders.orderNumber = orderdetails.orderNumber
group by customers.customerNumber 
order by
	total desc ;

select purchasetotal.customerNumber, purchasetotal.customerName, total
from purchasetotal
where total > (select round(avg(testtable.total), 2) as average_total
from (select
	distinct orders.customerNumber,
	customerName,
	sum(orderdetails.quantityOrdered*orderdetails.priceEach) as total
from
	customers
join orders on
	orders.customerNumber = customers.customerNumber
join orderdetails on
	orders.orderNumber = orderdetails.orderNumber
group by
	orders.customerNumber
order by
	total desc) as testtable)
;

