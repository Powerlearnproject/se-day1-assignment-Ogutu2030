Basic SELECT Statement: Use this to retrieve data from the table. For example:

sql
SELECT * FROM Expenses;
Wildcards (%) and Comparison Operators: To search for specific patterns (e.g., expenses with descriptions containing "office"):

sql
SELECT * FROM Expenses
WHERE Description LIKE '%office%';
The % acts as a wildcard that matches any sequence of characters. You can pair this with comparison operators like <, >, =:

sql
SELECT * FROM Expenses
WHERE Amount > 1000;
WHERE Clause with Logical Operators (AND, OR, NOT): Combine multiple conditions. For example:

Retrieve expenses exceeding 1000 and categorized as "Travel":

sql
SELECT * FROM Expenses
WHERE Amount > 1000 AND Category = 'Travel';
Retrieve expenses less than 500 OR categorized as "Food":

sql
SELECT * FROM Expenses
WHERE Amount < 500 OR Category = 'Food';
Exclude "Miscellaneous" expenses:

sql
SELECT * FROM Expenses
WHERE NOT Category = 'Miscellaneous';
ORDER BY Clause: Organize retrieved data in ascending or descending order. For example:

Sort expenses by date in ascending order:

sql
SELECT * FROM Expenses
ORDER BY ExpenseDate ASC;
Sort expenses by amount in descending order:

sql
SELECT * FROM Expenses
ORDER BY Amount DESC;
