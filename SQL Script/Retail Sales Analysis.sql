SELECT  *
FROM `project-d108b6da-62f8-423c-9df.1234.retail_sales` LIMIT 1000;

--Q1 WHERE Clause
SELECT *
FROM `project-d108b6da-62f8-423c-9df.1234.retail_sales`
WHERE EXTRACT(YEAR FROM Date) = 2023;

--Q2 Above Average Total Amount
SELECT 
    SUM(`Total Amount`) AS Total_Revenue
FROM  `project-d108b6da-62f8-423c-9df.1234.retail_sales`
WHERE `Total Amount` > (
  SELECT AVG(`Total Amount`)
  FROM  `project-d108b6da-62f8-423c-9df.1234.retail_sales`
);

--Q3 Total Revenue
SELECT 
  SUM(`Total Amount`) AS Revenue
FROM `project-d108b6da-62f8-423c-9df.1234.retail_sales`;

--Q4 DISTINCT Categories
SELECT DISTINCT `Product Category`
FROM `project-d108b6da-62f8-423c-9df.1234.retail_sales`;


--05 GROUP BY Category
SELECT 
  `Product Category`,
  SUM(Quantity) AS Total_Quantity
FROM `project-d108b6da-62f8-423c-9df.1234.retail_sales`
GROUP BY `Product Category`;

--Q6 CASE (Age Groups)
SELECT 
  `Customer ID`,
  Age,
  CASE 
    WHEN Age < 30 THEN 'Youth'
    WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END AS `Age Group`
FROM `project-d108b6da-62f8-423c-9df.1234.retail_sales`;

--Q7 Conditional Aggregation
SELECT 
  Gender,
  COUNT(CASE WHEN `Total Amount` > 500 THEN 1 END) AS `High Value Transactions`
  FROM `project-d108b6da-62f8-423c-9df.1234.retail_sales`
GROUP BY Gender;

--Q8 HAVING Clause
SELECT 
  `Product Category`,
  SUM(`Total Amount`) AS `Total Revenue`
FROM `project-d108b6da-62f8-423c-9df.1234.retail_sales`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

--Q9 Calculated Field (Unit Cost Category)
SELECT 
  `Transaction ID`,
  `Price per Unit`,
  CASE 
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
  END AS `Unit Cost Category`
FROM `project-d108b6da-62f8-423c-9df.1234.retail_sales`;

--Q10 WHERE + CASE
SELECT 
  `Customer ID`,
  Age,
  `Total Amount`,
  CASE 
    WHEN `Total Amount` > 1000 THEN 'High'
    ELSE 'Low'
  END AS `Spending Level`
FROM `project-d108b6da-62f8-423c-9df.1234.retail_sales`
WHERE Age >= 40;

