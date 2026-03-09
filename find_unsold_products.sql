SQL Pattern: Anti-Join (Exclusion)


question: Identify all products in the company catalog that have never been sold. 
This is required for inventory cleanup to identify stale or discontinued items that are taking up space in the Production.Product table without generating revenue in Sales.SalesOrderDetail.


APPROACH 1: 



SELECT DISTINCT 
    P.Name 
FROM Production.Product P
LEFT JOIN Sales.SalesOrderDetail S
    ON P.ProductID = S.ProductID
WHERE S.ProductID IS NULL;

APPROACH 2: 



SELECT 
    P.Name 
FROM Production.Product P
WHERE NOT EXISTS (
    SELECT 1 
    FROM Sales.SalesOrderDetail S
    WHERE S.ProductID = P.ProductID
);
