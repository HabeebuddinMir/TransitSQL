
--Uncomment this code if you are running the script for the second time

--DROP SEQUENCE passenger_q;
--DROP SEQUENCE train_q;
--DROP SEQUENCE station_q;
--DROP SEQUENCE route_q;
--DROP SEQUENCE ticket_q;
--DROP SEQUENCE schedule_q;
--DROP SEQUENCE alert_q;
--DROP SEQUENCE support_q;


CREATE SEQUENCE passenger_q
  START WITH 101
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  
CREATE SEQUENCE train_q
  START WITH 101
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE station_q
  START WITH 101
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  
CREATE SEQUENCE route_q
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  
CREATE SEQUENCE ticket_q
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
  
CREATE SEQUENCE schedule_q
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE alert_q
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE support_q
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;


INSERT INTO EmployeeType (EmployeeTypeID, TypeName) VALUES (1, 'Engine Driver');
INSERT INTO EmployeeType (EmployeeTypeID, TypeName) VALUES (2, 'Janitor');
INSERT INTO EmployeeType (EmployeeTypeID, TypeName) VALUES (3, 'Fare Inspector');
INSERT INTO EmployeeType (EmployeeTypeID, TypeName) VALUES (4, 'Technician');
INSERT INTO EmployeeType (EmployeeTypeID, TypeName) VALUES (5, 'Helper');
INSERT INTO EmployeeType (EmployeeTypeID, TypeName) VALUES (6, 'Receptionist');


INSERT INTO FareType (FareTypeID, TypeName, DiscountPercentage) VALUES (1, 'Normal', 0);
INSERT INTO FareType (FareTypeID, TypeName, DiscountPercentage) VALUES (2, 'Youth Fare', 50);
INSERT INTO FareType (FareTypeID, TypeName, DiscountPercentage) VALUES (3, 'Senior Fare', 70);
INSERT INTO FareType (FareTypeID, TypeName, DiscountPercentage) VALUES (4, 'Student Fare', 30);
INSERT INTO FareType (FareTypeID, TypeName, DiscountPercentage) VALUES (5, 'PSG Fare', 20);



INSERT INTO Station (StationID, StationCode, Name, StreetAddress, City) VALUES (station_q.nextval, 'OAKTT', 'Oakville Station', '2080 Nicholle Crossing', 'Oakville');
INSERT INTO Station (StationID, StationCode, Name, StreetAddress, City) VALUES (station_q.nextval, 'MALTT', 'Malton Station', '7878 Kirlin Cliff', 'Malton');
INSERT INTO Station (StationID, StationCode, Name, StreetAddress, City) VALUES (station_q.nextval, 'KITTT', 'Kitchener Station', '40142 Mariah Hill', 'Kitchener');
INSERT INTO Station (StationID, StationCode, Name, StreetAddress, City) VALUES (station_q.nextval, 'MIMTT', 'Mimico Station', '3862 Shanna Fort', 'Mimico');
INSERT INTO Station (StationID, StationCode, Name, StreetAddress, City) VALUES (station_q.nextval, 'CLKTT', 'Clarkson Station', '76541 Sheldon Coves', 'Clarkson');



INSERT INTO Route (RouteID, StartStationID, EndStationID, Distance) VALUES (route_q.nextval, 101, 103, 481);
INSERT INTO Route (RouteID, StartStationID, EndStationID, Distance) VALUES (route_q.nextval, 102, 104, 634);
INSERT INTO Route (RouteID, StartStationID, EndStationID, Distance) VALUES (route_q.nextval, 105, 101, 731);
INSERT INTO Route (RouteID, StartStationID, EndStationID, Distance) VALUES (route_q.nextval, 104, 101, 256);
INSERT INTO Route (RouteID, StartStationID, EndStationID, Distance) VALUES (route_q.nextval, 105, 101, 864);


INSERT INTO Schedule (ScheduleID, RouteID, DepartureTime) VALUES (schedule_q.nextval, 2, '13-APR-24 08.00.00.000000000');
INSERT INTO Schedule (ScheduleID, RouteID, DepartureTime) VALUES (schedule_q.nextval, 4, '13-APR-24 10.00.00.000000000');
INSERT INTO Schedule (ScheduleID, RouteID, DepartureTime) VALUES (schedule_q.nextval, 1, '13-APR-24 11.00.00.000000000');
INSERT INTO Schedule (ScheduleID, RouteID, DepartureTime) VALUES (schedule_q.nextval, 5, '13-APR-24 09.00.00.000000000');
INSERT INTO Schedule (ScheduleID, RouteID, DepartureTime) VALUES (schedule_q.nextval, 3, '13-APR-24 07.00.00.000000000 PM'); --Pending


INSERT INTO Train (TrainID, TrainNumber, Status, Capacity, RouteId) VALUES (train_q.nextval, '21A', 'In Service', 80, 3);
INSERT INTO Train (TrainID, TrainNumber, Status, Capacity, RouteId) VALUES (train_q.nextval, '56G', 'Out of Service', 100, 2);
INSERT INTO Train (TrainID, TrainNumber, Status, Capacity, RouteId) VALUES (train_q.nextval, '42N', 'In Service', 70, 1);
INSERT INTO Train (TrainID, TrainNumber, Status, Capacity, RouteId) VALUES (train_q.nextval, '36U', 'In Service', 120, 4);
INSERT INTO Train (TrainID, TrainNumber, Status, Capacity, RouteId) VALUES (train_q.nextval, '78C', 'Out of Service', 80, 3);


INSERT INTO Employee (EmployeeID, Name, EmployeeTypeID, ContactInfo) VALUES (1, 'Gail Richardson', 2, 'g.richardson@gmail.com');
INSERT INTO Employee (EmployeeID, Name, EmployeeTypeID, ContactInfo) VALUES (2, 'Pam Leblanc', 1, 'pam.leblanc@gmail.com');
INSERT INTO Employee (EmployeeID, Name, EmployeeTypeID, ContactInfo) VALUES (3, 'Emma Stokes', 5, 'emma.stokes@gmail.com');
INSERT INTO Employee (EmployeeID, Name, EmployeeTypeID, ContactInfo) VALUES (4, 'Loyd Zuniga', 4, 'l.zungia@gmail.com');
INSERT INTO Employee (EmployeeID, Name, EmployeeTypeID, ContactInfo) VALUES (5, 'Gloria Hoffman', 3, 'g.hoffman@gmail.com');


INSERT INTO EmployeeDesignation (EmployeeDesignationID, EmployeeID, TrainID, StationID, IsCustomerSupport) VALUES (1, 1, null, 101, 0);
INSERT INTO EmployeeDesignation (EmployeeDesignationID, EmployeeID, TrainID, StationID, IsCustomerSupport) VALUES (2, 2, 102, null, 0);
INSERT INTO EmployeeDesignation (EmployeeDesignationID, EmployeeID, TrainID, StationID, IsCustomerSupport) VALUES (3, 3, null, 103, 0);
INSERT INTO EmployeeDesignation (EmployeeDesignationID, EmployeeID, TrainID, StationID, IsCustomerSupport) VALUES (4, 4, 103, null, 0);
INSERT INTO EmployeeDesignation (EmployeeDesignationID, EmployeeID, TrainID, StationID, IsCustomerSupport) VALUES (5, 5, 104, null, 1);


INSERT INTO Alert (AlertID, Type, Description, ScheduleID, TimeAdded) VALUES (alert_q.nextval, 'Incident', 'Incident', 2, 15);
INSERT INTO Alert (AlertID, Type, Description, ScheduleID, TimeAdded) VALUES (alert_q.nextval, 'Construction', 'Construction on Oakville station, so slight delay in departure', 3, 5);
INSERT INTO Alert (AlertID, Type, Description, ScheduleID, TimeAdded) VALUES (alert_q.nextval, 'Late Arrival', 'Train was slower than expected', 1, 2);
INSERT INTO Alert (AlertID, Type, Description, ScheduleID, TimeAdded) VALUES (alert_q.nextval, 'Incident', 'Incident', 4, 10);
INSERT INTO Alert (AlertID, Type, Description, ScheduleID, TimeAdded) VALUES (alert_q.nextval, 'Late Arrival', 'Train reaching later than expected', 5, 3);


INSERT INTO Incident (IncidentID, Description, AlertID) VALUES (1, 'Deer stuck on train tracks', 1);
INSERT INTO Incident (IncidentID, Description, AlertID) VALUES (2, 'Someone pushed the yellow strip', 4);


INSERT INTO Passenger (PassengerID, Name, ContactInfo, FareTypeID) VALUES (passenger_q.nextval, 'Vanessa Wade', 'v.wade@gmail.com', 5);
INSERT INTO Passenger (PassengerID, Name, ContactInfo, FareTypeID) VALUES (passenger_q.nextval, 'Regina Lowery', 'regina.l@gmail.com', 2);
INSERT INTO Passenger (PassengerID, Name, ContactInfo, FareTypeID) VALUES (passenger_q.nextval, 'Bruce Elliott', 'bruceelliott@gmail.com', 3);
INSERT INTO Passenger (PassengerID, Name, ContactInfo, FareTypeID) VALUES (passenger_q.nextval, 'Elma Davila', 'el.davila@gmail.com', 1);
INSERT INTO Passenger (PassengerID, Name, ContactInfo, FareTypeID) VALUES (passenger_q.nextval, 'Ollie Dyer', 'ollie.dyer@gmail.com', 4);


INSERT INTO Ticket (TicketID, RouteID, PassengerID, Fare) VALUES (ticket_q.nextval, 2, 101, 7);
INSERT INTO Ticket (TicketID, RouteID, PassengerID, Fare) VALUES (ticket_q.nextval, 1, 103, 9);
INSERT INTO Ticket (TicketID, RouteID, PassengerID, Fare) VALUES (ticket_q.nextval, 5, 104, 11);
INSERT INTO Ticket (TicketID, RouteID, PassengerID, Fare) VALUES (ticket_q.nextval, 4, null, 10);
INSERT INTO Ticket (TicketID, RouteID, PassengerID, Fare) VALUES (ticket_q.nextval, 3, 102, 5);
INSERT INTO Ticket (TicketID, RouteID, PassengerID, Fare) VALUES (ticket_q.nextval, 5, null, 11);



INSERT INTO CustomerSupport (CustomerSupportID, Status, Subject, Description, PassengerID, EmployeeID) VALUES (support_q.nextval, 'Open', 'Refund Ticket', 'Hi, I have accidently bought the wrong ticket can I refund it please', 102, 5);
INSERT INTO CustomerSupport (CustomerSupportID, Status, Subject, Description, PassengerID, EmployeeID) VALUES (support_q.nextval, 'Closed', 'Help in fare type', 'Hello, I am a student and want to upgrade my fare type to student fare. Can you help me with that pl', 104, 5);

INSERT INTO Maintenance (MaintenanceID, TrainID, LastMaintainanceDate) VALUES (1, 101, '13-APR-24');
INSERT INTO Maintenance (MaintenanceID, TrainID, LastMaintainanceDate) VALUES (2, 102, '10-JUN-23');
INSERT INTO Maintenance (MaintenanceID, TrainID, LastMaintainanceDate) VALUES (3, 103, '05-JAN-24');
INSERT INTO Maintenance (MaintenanceID, TrainID, LastMaintainanceDate) VALUES (4, 104, '23-DEC-23');
INSERT INTO Maintenance (MaintenanceID, TrainID, LastMaintainanceDate) VALUES (5, 105, '18-AUG-23');


INSERT INTO PerformanceMetrics (PerformanceMetricsID, MetricType, Value, StationID) VALUES (1, 'Cleaniness', 7, 102);
INSERT INTO PerformanceMetrics (PerformanceMetricsID, MetricType, Value, StationID) VALUES (2, 'Railcar Delays', 4, 101);
INSERT INTO PerformanceMetrics (PerformanceMetricsID, MetricType, Value, StationID) VALUES (3, 'Cleaniness', 9, 103);
INSERT INTO PerformanceMetrics (PerformanceMetricsID, MetricType, Value, StationID) VALUES (4, 'Railcar Delays', 2, 103);


INSERT INTO AccessibilityFeature (AccessibilityFeatureID, TypeName, IsAvailable, StationID) VALUES (1, 'Wheel Chair', 1, 102);
INSERT INTO AccessibilityFeature (AccessibilityFeatureID, TypeName, IsAvailable, StationID) VALUES (2, 'Parking', 0, 103);
INSERT INTO AccessibilityFeature (AccessibilityFeatureID, TypeName, IsAvailable, StationID) VALUES (3, 'Accessible washrooms', 1, 102);
INSERT INTO AccessibilityFeature (AccessibilityFeatureID, TypeName, IsAvailable, StationID) VALUES (4, 'Parking', 1, 101);
INSERT INTO AccessibilityFeature (AccessibilityFeatureID, TypeName, IsAvailable, StationID) VALUES (5, 'Wheel Chair', 0, 101);

