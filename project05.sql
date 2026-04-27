/*query 1*/
USE v_art;

SELECT artfile
FROM artwork
WHERE period= "Impressionism";

/*query 2*/
SELECT artfile
FROM artwork a 
LEFT JOIN artwork_keyword ak 
ON a.artwork_id=ak.artwork_id
LEFT JOIN keyword k 
ON ak.keyword_id= k.keyword_id
WHERE keyword LIKE "flower%";

/*query 3*/
SELECT fname, lname, title
FROM artist
LEFT JOIN artwork
ON artwork.artist_id=artist.artist_id;

/*query 4*/
USE magazine;

SELECT magazineName, subscriberLastName, subscriberFirstName
FROM magazine m
LEFT JOIN subscription s
ON m.magazineKey=s.magazineKey
LEFT JOIN subscriber sr
ON s.subscriberKey=sr.subscriberKey
WHERE subscriberLastName IS NOT NULL
ORDER BY magazineName ASC;

/*query 5*/
SELECT magazineName
FROM magazine m
LEFT JOIN subscription s
ON m.magazineKey=s.magazineKey
LEFT JOIN subscriber sr
ON s.subscriberKey=sr.subscriberKey
WHERE subscriberFirstName="Samantha" and subscriberLastName="Sanders";

/*query 6*/
USE employees;

SELECT first_name, last_name
FROM employees e 
LEFT JOIN dept_emp de 
ON e.emp_no= de.emp_no
LEFT JOIN departments d 
ON de.dept_no=d.dept_no
WHERE dept_name="Customer Service"
ORDER BY last_name ASC
LIMIT 5;

/*query 7*/
SELECT first_name, last_name, dept_name, salary, s.from_date
FROM departments d 
LEFT JOIN dept_emp de 
ON d.dept_no=de.dept_no
LEFT JOIN employees e 
ON de.emp_no= e.emp_no  
LEFT JOIN salaries s 
ON e.emp_no=s.emp_no
WHERE first_name="Berni" AND last_name="Genin"
ORDER BY s.from_date DESC
LIMIT 1;

/*query 8*/
USE bike;

SELECT ROUND(AVG(quantity),0)
FROM stock;

/*query 9*/
SELECT product_name
FROM product p 
LEFT JOIN stock s 
ON p.product_id=s.product_id
WHERE quantity="0"
ORDER BY product_name ASC;

/*query 10*/
SELECT category_name, SUM(quantity) AS instock
FROM category c
LEFT JOIN product p
ON c.category_id=p.category_id
LEFT JOIN stock s 
ON p.product_id=s.product_id
WHERE store_id=2
GROUP BY category_name
ORDER BY instock ASC;

/*query 11*/
USE employees;

SELECT COUNT(emp_no)
FROM employees;

/*query 12*/
SELECT dept_name, FORMAT(AVG(salary),2) AS average_salary
FROM departments d 
LEFT JOIN dept_emp de 
ON d.dept_no=de.dept_no
LEFT JOIN employees e 
ON de.emp_no= e.emp_no  
LEFT JOIN salaries s 
ON e.emp_no=s.emp_no
GROUP BY dept_name
HAVING AVG(salary)<60000;

/*query 13*/
SELECT dept_name, COUNT(gender) AS "Number of Females"
FROM departments d      
LEFT JOIN dept_emp de 
ON d.dept_no=de.dept_no
LEFT JOIN employees e 
ON de.emp_no= e.emp_no  
WHERE gender="F"
GROUP BY dept_name
ORDER BY dept_name ASC;




