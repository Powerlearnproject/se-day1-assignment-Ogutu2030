sql
-- Add a Category column to the Expenses table
ALTER TABLE Expenses
ADD Category VARCHAR(50);

-- Categorize data by updating the Category column
UPDATE Expenses
SET Category = 'Travel'
WHERE Description LIKE '%flight%' OR Description LIKE '%hotel%';

UPDATE Expenses
SET Category = 'Food'
WHERE Description LIKE '%restaurant%' OR Description LIKE '%grocery%';
2. Hierarchical Categories
Set up parent-child categories using a self-referencing Foreign Key:

sql
-- Create a Categories table with a hierarchy
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50),
    ParentCategoryID INT,
    FOREIGN KEY (ParentCategoryID) REFERENCES Categories(CategoryID)
);

-- Insert data into the Categories table
INSERT INTO Categories (CategoryID, CategoryName, ParentCategoryID)
VALUES (1, 'Work Expenses', NULL), -- Parent category
       (2, 'Office Supplies', 1), -- Child category under Work Expenses
       (3, 'Travel', NULL),
       (4, 'Accommodation', 3); -- Child category under Travel
3. Enforcing Categorization with Constraints
Use a CHECK constraint to ensure data is categorized correctly:

sql
-- Create a table with a CHECK constraint on the Category column
CREATE TABLE Expenses (
    ExpenseID INT PRIMARY KEY,
    Description VARCHAR(255),
    Amount DECIMAL(10, 2),
    ExpenseDate DATE,
    Category VARCHAR(50),
    CHECK (Category IN ('Travel', 'Food', 'Office Supplies', 'Miscellaneous'))
);

-- Insert categorized data
INSERT INTO Expenses (ExpenseID, Description, Amount, ExpenseDate, Category)
VALUES (1, 'Hotel booking', 5000, '2025-04-01', 'Travel'),
       (2, 'Office chair', 150, '2025-04-02', 'Office Supplies');
4. Using Tags for Flexible Categorization
Add a Tags column with multiple tags for a single entry:

sql
-- Add a Tags column to the Expenses table
ALTER TABLE Expenses
ADD Tags VARCHAR(255);

-- Update Tags for an expense
UPDATE Expenses
SET Tags = 'High Priority, Recurring'
WHERE ExpenseID = 1;
5. Partitioning Data
Partition a table by category for faster access:

sql
-- Create a partitioned table
CREATE TABLE Expenses_Travel (
    ExpenseID INT PRIMARY KEY,
    Description VARCHAR(255),
    Amount DECIMAL(10, 2),
    ExpenseDate DATE
);

CREATE TABLE Expenses_Food (
    ExpenseID INT PRIMARY KEY,
    Description VARCHAR(255),
    Amount DECIMAL(10, 2),
    ExpenseDate DATE
);

-- Insert data into category-specific partitions
INSERT INTO Expenses_Travel (ExpenseID, Description, Amount, ExpenseDate)
VALUES (1, 'Flight ticket', 300, '2025-04-01');

INSERT INTO Expenses_Food (ExpenseID, Description, Amount, ExpenseDate)
VALUES (2, 'Restaurant bill', 50, '2025-04-02');
