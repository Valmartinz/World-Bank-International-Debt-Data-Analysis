
SELECT *
FROM international_debt
LIMIT 10;

--Task1
--Find the number of distinct countries.
SELECT COUNT(DISTINCT country_name) AS total_distinct_countries
FROM international_debt;

--Task2
--Extract the unique debt indicators in the table.
SELECT DISTINCT indicator_code AS distinct_debt_indicators
FROM international_debt
ORDER BY distinct_debt_indicators;

--Task3
--Find out the total amount of debt as reflected in the table.
SELECT 
    ROUND(SUM (debt) / 1000000, 2) AS total_debt
FROM international_debt; 

--Task4
--Find out the country owing to the highest debt.
SELECT 
    country_name,
    SUM(debt) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;

--Task5
--Determine the average amount of debt owed across the categories.
SELECT 
    indicator_code AS debt_indicator,
    indicator_name,
    AVG(debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 10;

--Task6
--Find out the country with the highest amount of principal repayments.
SELECT 
    country_name, 
    indicator_name
FROM international_debt
WHERE debt = (SELECT 
                 MAX(debt)
             FROM International_debt
             WHERE indicator_code = 'DT.AMT.DLXF.CD');

--Task7
--Find out the debt indicator that appears most frequently.
SELECT indicator_code,
        COUNT(indicator_code) AS indicator_count
    FROM international_debt
    GROUP BY indicator_code
    ORDER BY indicator_count DESC, indicator_code DESC
    LIMIT 10;
	
--Task8
--Get the maximum amount of debt that each country owes.
SELECT country_name,
        ROUND(MAX(debt),2) AS maximum_debt
FROM international_debt
GROUP BY country_name
ORDER BY maximum_debt DESC
LIMIT 10;
