select * from swiggy;

-- How many resturants have a rating greater than 4.5?

SELECT COUNT(distinct restaurant_name) AS 'Restaurants(rating > 4.5)' 
FROM swiggy 
WHERE rating > 4.5;

-- Which is the top 1 city with the highest number of restaurants?

SELECT city,COUNT(DISTINCT restaurant_name) AS restaurant_count 
FROM swiggy 
GROUP BY city
ORDER BY restaurant_count DESC 
LIMIT 1;

-- How many restaurants have the word "Pizza" in their name?

SELECT COUNT(DISTINCT restaurant_name) AS 'RESTAURANTS HAVING PIZZA IN NAME'
FROM swiggy 
WHERE LOWER(cuisine) 
LIKE '%pizza%';

-- What is the most common cuisine among the restaurants in the dataset?

SELECT cuisine, COUNT(*) AS cuisine_count
FROM swiggy
GROUP BY cuisine
ORDER BY cuisine_count DESC 
LIMIT 1;

-- What is the average rating of restaurants in each city?

SELECT city, ROUND(AVG(rating),2) AS avg_rating 
FROM swiggy 
GROUP BY city;

-- What is the highest price of item under the 'recommended' menu category for 
-- each restaurant?

SELECT DISTINCT restaurant_name , menu_category , MAX(price) AS highest_price
FROM swiggy 
WHERE menu_category = 'recommended' 
GROUP BY restaurant_name,menu_category;

/* Find the top 5 most expensive restaurants that offer cuisine other 
than Indian cuisine? */

SELECT DISTINCT restaurant_name,cost_per_person
FROM swiggy 
WHERE lower(cuisine)<>'indian' 
ORDER BY cost_per_person DESC LIMIT 5;	  

/* Find the restaurants that have an cost which is higher than the total
average cost of all the restaurants together? */

SELECT DISTINCT restaurant_name,cost_per_person 
FROM swiggy
WHERE cost_per_person > (SELECT AVG(cost_per_person) from swiggy); 

/* Retrieve the details of restaurants that have the same name but
are located in different cities. */

SELECT DISTINCT t1.restaurant_name, t1.city , t2.city
FROM swiggy t1 
JOIN swiggy t2 
ON t1.restaurant_name=t2.restaurant_name 
AND t1.city<>t2.city;

/* Which restaurant offers the most number of items in the
'main_course' category? */

SELECT DISTINCT restaurant_name,menu_category,
COUNT(item) AS number_of_items 
FROM swiggy
WHERE menu_category='Main Course'
GROUP BY restaurant_name,menu_category
ORDER BY number_of_items DESC LIMIT 1; 

/* List the names of restaurants that are 100% vegetarian in alphabetical order
of restaurant name */

SELECT DISTINCT restaurant_name,veg_or_nonveg 
FROM swiggy 
WHERE veg_or_nonveg = 'Veg'
ORDER BY restaurant_name; 



























































