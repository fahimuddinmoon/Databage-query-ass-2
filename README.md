<h1>## Explain the Primary Key and Foreign Key concepts in PostgreSQL.</h1>
<h2>Primary Key</h2>
<p>A Primary Key is a column (or a combination of columns) in a table that uniquely identifies each row. It must contain unique values and cannot be NULL. Every table should have one primary key to ensure that each record can be found or referred to uniquely.</p>
<h2>Foreign Key</h2>
<p>A Foreign Key is a column (or a set of columns) that creates a link between two tables. It refers to the Primary Key of another table, ensuring that the value in this column exists in the referenced table. This is used to maintain relationships between data in different tables.</p>

<h1>## Explain the purpose of the WHERE clause in a SELECT statement.</h1>
<h2>SELECT</h2>
<p>The SELECT clause specifies which columns to retrieve from a database table. It fetches only the requested data, whether one, multiple, or all columns. The SQL engine reads the needed columns from storage, and you can also use expressions, functions, or rename columns in the output. Without filtering, it returns data from all rows.</p>
<h2>WHERE</h2>
<p>The WHERE clause filters rows based on conditions. After accessing the table, it checks each row against the condition and includes only those that meet it. Conditions can involve comparisons, patterns, ranges, or null checks. The database may use indexes on columns in the WHERE clause to speed up filtering.</p>

<h1>## How can you modify data using UPDATE statements?</h1>
<h2>Data in a database can be modified using the UPDATE statement. First, the table name is specified, then in the SET clause, the columns to be changed and their new values are defined. If a WHERE clause is included, only the rows that meet the condition are updated; otherwise, all rows in the table are modified. This allows existing data to be changed easily and precisely.</h2>

<h1>## Explain the GROUP BY clause and its role in aggregation operations.</h1>
<h2>The GROUP BY clause groups rows that have the same values in certain columns. This helps when using functions like sum, count, or average to get results for each group instead of the whole table. It basically organizes data so you can see summary information for each group.</h2>

<h1>## How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?</h1>
<h2>In PostgreSQL, aggregate functions like COUNT(), SUM(), and AVG() are used to perform calculations on multiple rows and return a single summarized value. To calculate these, you include the function in a SELECT statement along with the column you want to aggregate. COUNT() returns the number of rows, SUM() adds up all the values in a column, and AVG() calculates the average of the values. These functions can be used alone to get totals for the entire table or combined with a GROUP BY clause to get results for specific groups of rows.</h2>
