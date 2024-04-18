-- Queries for all the views created

--View Employees with their employee type and designation
SELECT * FROM EmployeeDetailsView;

--View Passengers with FareType
SELECT * FROM PassengersDetailsView;

--View all schedule details
SELECT * FROM AllScheduleDetailsView;

--View open state customer support tickets
SELECT * FROM OpenTicketsView;

--View tickets bought by each passenger
SELECT * FROM TicketDetilsView;

--View trains that need another maintenance round
SELECT * FROM MaintenanceCheckView;

--View accessibility features available for a train station
SELECT * FROM AccessibilityFeaturesCheckView;



--Fetch all the employee info based on their name
SELECT e.Name, e.ContactInfo, et.TypeName, ed.TrainID, ed.StationID, ed.IsCustomerSupport
FROM Employee e
INNER JOIN EmployeeType et ON et.EmployeeTypeID = e.EmployeeTypeID
INNER JOIN EmployeeDesignation ed ON ed.EmployeeID = e.EmployeeID
WHERE e.Name LIKE '%Pam%';

--Fetch count of employee based on the employee type
SELECT COUNT(Name) AS No_Of_Employee_For_Type FROM Employee e
INNER JOIN EmployeeType et ON et.EmployeeTypeID = e.EmployeeTypeID
WHERE et.TypeName = 'Engine Driver'
GROUP BY et.TypeName;

--Fetch all the accessibility feature available for a station using station code
SELECT * FROM AccessibilityFeature af
INNER JOIN Station s ON s.StationID = af.StationID
WHERE s.StationCode = 'MALTT' AND af.IsAvailable = 1;

--Fetch count of passenger having certain fare type
SELECT COUNT(p.Name) AS Passenger_Count_For_Fare_Type
FROM Passenger p
INNER JOIN FareType ft ON ft.FareTypeID = p.FareTypeID
WHERE ft.TypeName = 'Student Fare'
GROUP BY ft.TypeName;

--Fetch all the employ details who are working in a train
SELECT e.Name, e.ContactInfo, t.TrainNumber FROM EmployeeDesignation ed
INNER JOIN Employee e ON e.EmployeeID = ed.EmployeeID
INNER JOIN Train t ON t.TrainID = ed.TrainID
WHERE ed.TrainID IS NOT NULL;

--Fetch all the employ details who are working in a station
SELECT e.Name, e.ContactInfo, st.Name FROM EmployeeDesignation ed
INNER JOIN Employee e ON e.EmployeeID = ed.EmployeeID
INNER JOIN Station st ON st.StationID = ed.StationID
WHERE ed.StationID IS NOT NULL;

--Fetch all the train numbers that visits a certain station using station code
SELECT t.TrainNumber FROM Route r
INNER JOIN Train t ON t.RouteID = r.RouteID
LEFT JOIN Station st1 ON st1.StationID = r.StartStationID
LEFT JOIN Station st2 ON st2.StationID = r.EndStationID
WHERE st1.StationCode = 'OAKTT' OR st2.StationCode = 'OAKTT';


--Update trains last maintenance data using train number
UPDATE Maintenance SET LastMaintainanceDate = SYSDATE
WHERE TrainID = (SELECT TrainID FROM Train WHERE TrainNumber = '78C');


--Update support ticket status using CustomerSupportID
UPDATE CustomerSupport SET Status = 'Closed'
WHERE CustomerSupportID = 1;
