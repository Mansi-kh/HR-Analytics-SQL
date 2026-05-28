-- Query 1: Total Employees by Department
SELECT Department, 
       COUNT(*) AS Total_Employees
FROM hr_analytics
GROUP BY Department
ORDER BY Total_Employees DESC;

-- Query 2: Gender Distribution by Department
SELECT Department, 
       Gender, 
       COUNT(*) AS Employee_Count
FROM hr_analytics
GROUP BY Department, Gender
ORDER BY Department, Employee_Count DESC;

-- Query 3: Average Age by Department

SELECT Department, 
       ROUND(AVG(Age), 1) AS Average_Age,
       MIN(Age) AS Youngest,
       MAX(Age) AS Oldest
FROM hr_analytics
GROUP BY Department
ORDER BY Average_Age DESC;

-- Query 4: Overall Attrition Rate
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_analytics;
-- Query 5: Attrition by Department
SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_analytics
GROUP BY Department
ORDER BY Attrition_Rate_Percent DESC;

-- Query 6: Attrition by Age Group
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_analytics
GROUP BY Age_Group
ORDER BY Attrition_Rate_Percent DESC;
