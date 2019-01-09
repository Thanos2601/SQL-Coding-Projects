Use AdventureWorks2014
GO

ALTER PROCEDURE dbo.uspGetProduction @CostRate decimal(8,2) = NULL, @Availability decimal(8,2) = NULL
AS
SELECT Production.Location.Name, Production.Location.CostRate, 
Production.Location.Availability, Production.Document.Title, Production.Document.FileName,
Person.Person.FirstName, Person.Person.LastName
FROM Production.Location
LEFT JOIN Production.Document ON Production.Location.LocationID = Production.Document.DocumentType
LEFT JOIN Person.Person ON Production.Location.LocationID = Person.Person.BusinessEntityID
WHERE CostRate >= ISNULL(@CostRate,CostRate)
AND Availability >= ISNULL(@Availability,Availability)
GO

EXECUTE [dbo].[uspGetProduction] @CostRate = 10;


SELECT * FROM Production.Location;
--Got an error using this, couldn't figure out how to add a column with an incrementing value.
ALTER TABLE Production.Location
ADD LocationType smallint NULL

ALTER TABLE Production.Location
DROP COLUMN LocationType

-- This variable sequence works.
DECLARE @myVar smallint
SET @myVar = 0

UPDATE
  Production.Location
	SET 
	@myVar = LocationType = @myVar + 1

SELECT * FROM Production.Document;