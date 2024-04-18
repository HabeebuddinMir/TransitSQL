--View Employees with their employee type and designation
CREATE VIEW EmployeeDetailsView AS
SELECT e.Name, e.ContactInfo, et.TypeName, ed.TrainID, ed.StationID, ed.IsCustomerSupport
FROM Employee e
INNER JOIN EmployeeType et ON et.EmployeeTypeID = e.EmployeeTypeID
INNER JOIN EmployeeDesignation ed ON ed.EmployeeID = e.EmployeeID;


--View Passengers with FareType
CREATE VIEW PassengersDetailsView AS
SELECT p.Name, p.ContactInfo, ft.TypeName, ft.DiscountPercentage 
FROM Passenger p
INNER JOIN FareType ft ON ft.FareTypeID = p.FareTypeID;


--View all schedule details
CREATE VIEW AllScheduleDetailsView AS
SELECT s.ScheduleID, s.DepartureTime, st1.Name AS StartStation, st2.Name AS EndStation 
FROM Schedule s
INNER JOIN Route r ON r.RouteID = s.RouteID
LEFT JOIN Station st1 ON st1.StationID = r.StartStationID
LEFT JOIN Station st2 ON st2.StationID = r.EndStationID
ORDER BY s.ScheduleID;



--View open state customer support tickets
CREATE VIEW OpenTicketsView AS
SELECT cs.CustomerSupportID, cs.Status, cs.Subject, cs.Description, p.Name AS RaisedBy, e.Name AS AssignedTo 
FROM CustomerSupport cs
INNER JOIN Passenger p ON p.PassengerID = cs.PassengerID
INNER JOIN Employee e ON e.EmployeeID = cs.EmployeeID
WHERE Status = 'Open';


--View tickets bought by each passenger
CREATE VIEW TicketDetilsView AS
SELECT t.TicketID, p.Name, st1.Name AS StartStation, st2.Name AS EndStation 
FROM Ticket t
LEFT JOIN Passenger p ON p.PassengerID = t.PassengerID
INNER JOIN Route r ON r.RouteID = t.RouteID
LEFT JOIN Station st1 ON st1.StationID = r.StartStationID
LEFT JOIN Station st2 ON st2.StationID = r.EndStationID;



--View trains that need another maintenance round
CREATE VIEW MaintenanceCheckView AS
SELECT m.MaintenanceID, t.TrainNumber, m.LastMaintainanceDate, t.Status
FROM Maintenance m
INNER JOIN Train t ON t.TrainID = m.TrainID
WHERE m.LastMaintainanceDate < SYSDATE - 30;


--View accessibility features available for a train station
CREATE VIEW AccessibilityFeaturesCheckView AS
SELECT af.AccessibilityFeatureID, af.TypeName, s.Name
FROM AccessibilityFeature af
INNER JOIN Station s ON s.StationID = af.StationID
WHERE af.IsAvailable = 1;