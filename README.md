# sql-project-fc
Hi all,
There's my final project for SQL in Data Science bootcamp.

This project is the result of completing a 100-hour bootcamp at the Future Collars training company in Poland.
I used MySQL to implement the project.
I didn't use ChatGPT or Bard ;)

Enjoy!

##########

Project tasks:

1. Create a "Clothing Store" Database

2. Create a "Manufacturers" table with the following columns:

manufacturer id
The manufacturer's name
manufacturer's address
manufacturer's tax identification number
date of signing the contract with the manufacturer
Set an appropriate "constraint" for each column

3. Create a "Products" table with columns:

product id
manufacturer id
Product name
product description
net purchase price
gross purchase price
net selling price
gross selling price
VAT percentage of sales
Set an appropriate "constraint" for each column

4. Create an "Orders" table with columns:

order id
client id
product id
date of order
Set an appropriate "constraint" for each column

5. Create a "Customers" table with columns:

client id
name
last name
address
Set an appropriate "constraint" for each column
 
6. Join tables together using foreign keys:

Products – Manufacturers
Orders – Products
Orders - Customers

7. Complete each table with data according to:

"Producers" table – 4 items
"Products" table – 20 items
"Orders" table – 10 items
"Customers" table – 10 items
8. Display all products with all data from the manufacturer that is in position 1 in the "Manufacturers" table

9. Sort these products alphabetically by name

10. Calculate the average price for the product from the manufacturer in item 1

11. View two product groups from this manufacturer:

Half of the cheapest are the group: "Cheap"
The remaining ones are the group: "Dear"
12. View ordered products by displaying only their name

13. Display all products ordered - limiting the display to 5 items

14. Calculate the total value of all orders

15. View all orders with product name, sorting them by date from oldest to newest

16. Check whether you have completed all the data in the products table - display the items for which data is missing

17. View the most frequently sold product and its price

18. Find the day on which the most orders were placed
