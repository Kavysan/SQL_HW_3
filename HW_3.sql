--1. List all customers who live in Texas (use JOINs)
select c.first_name, c.last_name, a.district
from customer c
full join address a 
on a.address_id = c.address_id 
where district like 'Texas'


-- 2. Get all payments above $6.99 with the Customer's Full Name
select concat(c.first_name, ' ' ,c.last_name) as full_name, p.amount
from payment p
inner join customer c 
on p.customer_id = c.customer_id
where p.amount > 6.99
order by amount;


--3. Show all customers names who have made payments over $175(use subqueries)
select c.first_name,c.last_name, p.amount
from customer c
inner join (
    select customer_id, amount
    from payment
    where amount > 175
) p on c.customer_id = p.customer_id;


--4. List all customers that live in Nepal (use the city table)
select c.first_name, c.last_name,c3.country,c3.country_id
from customer c 
inner join address a 
on c.address_id=a.address_id
inner join city c2
on a.city_id =c2.city_id
inner join country c3
on c2.country_id= c3.country_id
where c3.country ='Nepal'

--5. Which staff member had the most transactions?
select s.staff_id, s.first_name, s.last_name, count(*) as transaction_count
from payment p
inner join staff s 
on p.staff_id = s.staff_id
group by s.staff_id, s.first_name, s.last_name
order by transaction_count desc
limit 1;
 

--6. How many movies of each rating are there?
select rating, count(rating)
from film
group by rating;


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select concat(c.first_name, ' ', c.last_name) as full_name
from customer c
where c.customer_id in (
    select p.customer_id
    from payment p
    where p.amount > 6.99
    group by p.customer_id
    having count(*) = 1
);

--8. How many free rentals did our stores give away?
select count(amount)
from payment
where amount = 0;


