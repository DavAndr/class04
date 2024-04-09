USE sakila;


SELECT title,special_features FROM film where (rating = 'PG-13');

SELECT title,length FROM film;

SELECT title,rental_rate,replacement_cost FROM film where (replacement_cost >= 20.00) and (replacement_cost < 24.00);

SELECT film.title,category.name,rating,special_features FROM (film INNER JOIN (
  category INNER JOIN film_category on category.category_id = film_category.category_id
  ) on film.film_id = film_category.category_id) where FIND_IN_SET('Behind the Scenes', special_features);

select DISTINCT actor.first_name, actor.last_name from actor INNER JOIN (film INNER JOIN film_actor on film.film_id = film_actor.film_id) on actor.actor_id = film_actor.actor_id where film.title = 'ZOOLANDER FICTION';

SELECT store.store_id, address.address, city.city, country.country
FROM store
INNER JOIN (address
    INNER JOIN (city
        INNER JOIN country ON city.country_id = country.country_id
    ) ON address.city_id = city.city_id
) ON store.address_id = address.address_id where (store.store_id = 1);

select distinct f1.title,f2.title,f1.rating,f2.rating  from film f1 inner join film f2 on f1.rating = f2.rating;

SELECT distinct film.title,store.store_id, staff.first_name, staff.last_name FROM film inner join ((store inner join staff on store.manager_staff_id = staff_id) inner join inventory on store.store_id = inventory.store_id) on film.film_id = inventory.film_id where store.store_id = 2;