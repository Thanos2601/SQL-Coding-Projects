Use AdventureWorks2014
GO

CREATE PROCEDURE dbo.uspGetProduction @CostRate decimal(8,2) = NULL, @Availability decimal(8,2) = NULL
AS
SELECT Production.Location.Name, Production.Location.CostRate, 
Production.Location.Availability, Production.Document.Title, Production.Document.FileName,
Person.Person.FirstName, Person.Person.LastName
FROM Production.Location
LEFT JOIN Production.Document ON Production.Location.LocationID = Production.Document.DocumentType
LEFT JOIN Person.Person ON Production.Location.LocationID = Person.Person.BusinessEntityID
WHERE CostRate = ISNULL(@CostRate,CostRate)
AND Availability = ISNULL(@Availability,Availability)
GO

EXECUTE [dbo].[uspGetProduction];


SELECT * FROM Production.Location;
--Got an error using this, couldn't figure out how to add a column with an incrementing value.
ALTER TABLE Production.Location
ADD LocationType smallint IDENTITY (1,1); 

/*
Successfully added a column with a default value of '1' 
but couldn't update it with incrementing values, got an error.
*/
ALTER TABLE Production.Location
ADD LocationType smallint DEFAULT (1) NOT NULL;
--Got a 'cannot insert NULL value' on this
INSERT INTO Production.Location(LocationType)
VALUES
	(1),
	(2),
	(3);

SELECT * FROM Production.Document;
--Got a 'cannot insert NULL value' on this
INSERT INTO Production.Document(DocumentID)
VALUES
	(1),
	(2),
	(3);

--Tried to delete the column and couldn't, somehow it decided some object depended on it...
ALTER TABLE Production.Document
DROP COLUMN DocumentID;