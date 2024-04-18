
--Uncomment this code if you are running the script for the second time

--DROP TABLE AccessibilityFeature;
--DROP TABLE Maintenance;
--DROP TABLE PerformanceMetrics;
--DROP TABLE CustomerSupport;
--DROP TABLE Ticket;
--DROP TABLE EmployeeDesignation;
--DROP TABLE Employee;
--DROP TABLE Incident;
--DROP TABLE Alert;
--DROP TABLE Passenger;
--DROP TABLE EmployeeType;
--DROP TABLE FareType;
--DROP TABLE Train;
--DROP TABLE Schedule;
--DROP TABLE Route;
--DROP TABLE Station;

--Master data
CREATE TABLE EmployeeType
(
    EmployeeTypeID NUMBER(5) PRIMARY KEY,
    TypeName VARCHAR(20) NOT NULL
);


CREATE TABLE FareType
(
    FareTypeID NUMBER(5) PRIMARY KEY,
    TypeName VARCHAR(20)  NOT NULL,
    DiscountPercentage NUMBER(2)  NOT NULL
);


CREATE TABLE Station
(
    StationID NUMBER(5) PRIMARY KEY,
    StationCode VARCHAR(5) NOT NULL,
    Name VARCHAR(20) NOT NULL,
    StreetAddress VARCHAR(50) NOT NULL,
    City VARCHAR(20)
);



CREATE TABLE Route
(
    RouteID NUMBER(5) PRIMARY KEY,
    StartStationID NUMBER(5) NOT NULL,
    EndStationID NUMBER(5) NOT NULL,
    Distance NUMBER(6),
    CONSTRAINT route_start_station_fk FOREIGN KEY (StartStationID)
    REFERENCES Station(StationID),
    CONSTRAINT route_end_station_fk2 FOREIGN KEY (EndStationID)
    REFERENCES Station(StationID)
);


CREATE TABLE Schedule
(
    ScheduleID NUMBER(5) PRIMARY KEY,
    RouteID NUMBER(5) NOT NULL,
    DepartureTime TIMESTAMP NOT NULL,
    CONSTRAINT schedule_route_fk FOREIGN KEY (RouteID)
    REFERENCES Route(RouteID)
);



CREATE TABLE Train
(
    TrainID NUMBER(5) PRIMARY KEY,
    TrainNumber VARCHAR(5) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Capacity NUMBER(3),
    RouteId NUMBER(5) NOT NULL,
    CONSTRAINT train_route_fk FOREIGN KEY (RouteId)
    REFERENCES Route(RouteID)
);



CREATE TABLE Employee
(
    EmployeeID NUMBER(5) PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    EmployeeTypeID NUMBER(5) NOT NULL,
    ContactInfo VARCHAR(30) NOT NULL,
    CONSTRAINT employee_employeetype_fk FOREIGN KEY (EmployeeTypeID)
    REFERENCES EmployeeType(EmployeeTypeID)
);



CREATE TABLE EmployeeDesignation
(
    EmployeeDesignationID NUMBER(5) PRIMARY KEY,
    EmployeeID NUMBER(5) NOT NULL,
    TrainID NUMBER(5),
    StationID NUMBER(5),
    IsCustomerSupport NUMBER(1) NOT NULL,
    CONSTRAINT employeeDesignation_employee_fk FOREIGN KEY (EmployeeID)
    REFERENCES Employee(EmployeeID),
    CONSTRAINT employeeDesignation_train_fk FOREIGN KEY (TrainID)
    REFERENCES Train(TrainID),
    CONSTRAINT employeeDesignation_station_fk FOREIGN KEY (StationID)
    REFERENCES Station(StationID)
);


CREATE TABLE Alert
(
    AlertID NUMBER(5) PRIMARY KEY,
    Type VARCHAR(20) NOT NULL,
    Description VARCHAR(100),
    ScheduleID NUMBER(5) NOT NULL,
    TimeAdded NUMBER(2),
    CONSTRAINT alert_schedule_fk FOREIGN KEY (ScheduleID)
    REFERENCES Schedule(ScheduleID)
);




CREATE TABLE Incident
(
    IncidentID NUMBER(5) PRIMARY KEY,
    Description VARCHAR(100) NOT NULL,
    AlertID NUMBER(5) NOT NULL,
    CONSTRAINT incident_alert_fk FOREIGN KEY (AlertID)
    REFERENCES Alert(AlertID)
);


CREATE TABLE Passenger
(
    PassengerID NUMBER(5) PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    ContactInfo VARCHAR(30) NOT NULL,
    FareTypeID NUMBER(5) NOT NULL,
    CONSTRAINT passenger_faretype_fk FOREIGN KEY (FareTypeID)
    REFERENCES FareType(FareTypeID)
);


CREATE TABLE Ticket
(
    TicketID NUMBER(5) PRIMARY KEY,
    RouteID NUMBER(5) NOT NULL,
    PassengerID NUMBER(5),
    Fare NUMBER(3) NOT NULL,
    PurchaseTime TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT ticket_route_fk FOREIGN KEY (RouteID)
    REFERENCES Route(RouteID),
    CONSTRAINT ticket_passenger_fk FOREIGN KEY (PassengerID)
    REFERENCES Passenger(PassengerID)
);



CREATE TABLE CustomerSupport
(
    CustomerSupportID NUMBER(5) PRIMARY KEY,
    Status VARCHAR(20) NOT NULL,
    Subject VARCHAR(50),
    Description VARCHAR(200) NOT NULL,
    PassengerID NUMBER(5) NOT NULL,
    EmployeeID NUMBER(5) NOT NULL,
    CONSTRAINT support_employee_fk FOREIGN KEY (EmployeeID)
    REFERENCES Employee(EmployeeID),
    CONSTRAINT support_passenger_fk FOREIGN KEY (PassengerID)
    REFERENCES Passenger(PassengerID)
);


CREATE TABLE Maintenance
(
    MaintenanceID NUMBER(5) PRIMARY KEY,
    TrainID NUMBER(5) NOT NULL,
    LastMaintainanceDate DATE NOT NULL,
    CONSTRAINT maintenance_train_fk FOREIGN KEY (TrainID)
    REFERENCES Train(TrainID)
);


CREATE TABLE PerformanceMetrics
(
    PerformanceMetricsID NUMBER(5) PRIMARY KEY,
    MetricType VARCHAR(100) NOT NULL,
    Value NUMBER(2) NOT NULL,
    StationID NUMBER(5) NOT NULL,
    CONSTRAINT performance_station_fk FOREIGN KEY (StationID)
    REFERENCES Station(StationID)
);

CREATE TABLE AccessibilityFeature
(
    AccessibilityFeatureID NUMBER(5) PRIMARY KEY,
    TypeName VARCHAR(20) NOT NULL,
    IsAvailable NUMBER(1) NOT NULL,
    StationID NUMBER(5) NOT NULL,
    CONSTRAINT accessibility_station_fk FOREIGN KEY (StationID)
    REFERENCES Station(StationID)
);



ALTER TABLE FareType
ADD CONSTRAINT positive_discount_check CHECK (DiscountPercentage >= 0);

ALTER TABLE Route
ADD CONSTRAINT positive_distance_check CHECK (Distance >= 0);

ALTER TABLE Train
ADD CONSTRAINT positive_capacity_check CHECK (Capacity >= 0);

ALTER TABLE Employee
ADD CONSTRAINT employee_email_format_check CHECK (REGEXP_LIKE(ContactInfo, '^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'));

ALTER TABLE EmployeeDesignation
ADD CONSTRAINT issupport_value_check CHECK (IsCustomerSupport IN (0, 1));

ALTER TABLE Alert
ADD CONSTRAINT alert_type_value_check CHECK (Type IN ('Incident', 'Construction', 'Late Arrival', 'Other'));

ALTER TABLE Alert
ADD CONSTRAINT positive_time_added_check CHECK (TimeAdded >= 0);

ALTER TABLE Passenger
ADD CONSTRAINT passenger_email_format_check CHECK (REGEXP_LIKE(ContactInfo, '^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'));

ALTER TABLE Ticket
ADD CONSTRAINT positive_fare_check CHECK (Fare >= 0);

ALTER TABLE CustomerSupport
ADD CONSTRAINT support_status_value_check CHECK (Status IN ('Open', 'Closed'));

ALTER TABLE PerformanceMetrics
ADD CONSTRAINT metric_type_value_check CHECK (MetricType IN ('Cleaniness', 'Railcar Delays'));

ALTER TABLE PerformanceMetrics
ADD CONSTRAINT positive_metric_value_check CHECK (Value >= 0);

ALTER TABLE AccessibilityFeature
ADD CONSTRAINT accessibility_type_value_check CHECK (TypeName IN ('Wheel Chair', 'Parking', 'Accessible washrooms'));

ALTER TABLE AccessibilityFeature
ADD CONSTRAINT isavailable_value_check CHECK (IsAvailable IN (0, 1));