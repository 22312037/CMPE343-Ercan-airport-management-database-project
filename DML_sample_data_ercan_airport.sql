-- ============================================================
-- ERCAN AIRPORT MANAGEMENT INFORMATION SYSTEM
-- DML - Sample Data
-- ============================================================

USE ercan_airport_management;

-- ============================================================
-- AIRLINES
-- ============================================================
INSERT INTO Airline (airline_name, country, founded_year) VALUES
('Turkish Airlines',      'Turkey', 1933),
('Pegasus Airlines',      'Turkey', 1990),
('Qatar Airways',         'Qatar',  1993),
('Emirates',              'UAE',    1985),
('Royal Jordanian',       'Jordan', 1963),
('Saudi Airlines',        'Saudi Arabia', 1945);

-- ============================================================
-- PLANE MODELS
-- ============================================================
INSERT INTO Plane_Model (model_name, manufacturer, max_range, fuel_capacity) VALUES
('Boeing 737-800',        'Boeing', 5600, 26000),
('Airbus A320neo',        'Airbus', 6300, 27000),
('Boeing 777-300ER',      'Boeing', 13650, 181000),
('Airbus A330-300',       'Airbus', 11750, 139000),
('Boeing 787 Dreamliner', 'Boeing', 14140, 126000),
('ATR72-600',             'ATR',    1528,  5000);

-- ============================================================
-- AIRPLANES
-- ============================================================
INSERT INTO Airplane
(plane_no, model_id, airline_id, capacity, manufacture_year, status)
VALUES
('TC-JGR', 1, 1, 189, 2017, 'ACTIVE'),
('TC-SUX', 1, 1, 189, 2015, 'ACTIVE'),
('PC-AEC', 2, 2, 180, 2020, 'ACTIVE'),
('A7-BDA', 3, 3, 396, 2018, 'ACTIVE'),
('A6-EMR', 4, 4, 300, 2019, 'ACTIVE'),
('JY-RJA', 5, 5, 290, 2021, 'ACTIVE'),
('HZ-ASA', 2, 6, 174, 2018, 'MAINTENANCE'),
('TC-PEG', 2, 2, 180, 2019, 'UNDER INSPECTION');

-- ============================================================
-- HANGARS
-- ============================================================
INSERT INTO Hangar (hangar_name, location, capacity) VALUES
('H-01', 'North Apron Section A', 4),
('H-02', 'North Apron Section B', 6),
('H-03', 'South Maintenance Zone', 3),
('H-04', 'VIP Aircraft Zone', 2);

-- ============================================================
-- HANGAR HISTORY
-- ============================================================
INSERT INTO Hangar_History
(plane_id, hangar_id, in_datetime, out_datetime)
VALUES
(7, 1, '2026-04-15 08:00:00', NULL),
(8, 2, '2026-05-01 10:30:00', NULL),
(1, 3, '2026-03-01 07:00:00', '2026-03-10 16:00:00'),
(2, 1, '2026-01-05 06:00:00', '2026-01-15 18:00:00'),
(4, 4, '2026-02-10 09:00:00', '2026-02-14 13:00:00');

-- ============================================================
-- UNION INFO
-- ============================================================
INSERT INTO Union_Info (union_name, union_address, union_phone) VALUES
('Aviation Technicians Union',      'Nicosia, Cyprus',     '+90-392-200-1001'),
('Air Traffic Controllers Union',   'Istanbul, Turkey',    '+90-212-450-2200'),
('Airport General Workers Union',   'Ankara, Turkey',      '+90-312-670-4500'),
('Middle East Aviation Union',      'Doha, Qatar',         '+974-4400-8899');

-- ============================================================
-- EMPLOYEES
-- ============================================================
INSERT INTO Employee
(ssn, first_name, last_name, gender, phone, salary,
hire_date, union_membership_no, union_id)
VALUES
('1001', 'Eyad',   'Mohamed',  'Male',   '0533000001', 7200.00, '2018-03-15', 'ATU-001', 1),
('1002', 'Ahmed',  'Yasir',  'Male',   '0533000002', 6800.00, '2019-07-12', 'ATU-002', 1),
('1003', 'Mohamed', 'Al-Fatih',   'Male',   '0533000003', 9100.00, '2017-01-10', 'ATC-001', 2),
('1004', 'Taha',  'Salah',   'Male',   '0533000004', 8500.00, '2020-04-18', 'ATC-002', 2),
('1005', 'Salim', 'Omar',    'Male',   '0533000005', 7600.00, '2016-09-25', 'ATU-003', 1),
('1006', 'Ali',    'Essam',    'Male',   '0533000006', 7000.00, '2021-06-14', 'AGW-001', 3),
('1007', 'Tariq',  'Kanaan',     'Male',   '0533000007', 9500.00, '2015-11-02', 'ATC-003', 2),
('1008', 'Fadi',   'Saleh',      'Male',   '0533000008', 7800.00, '2019-12-19', 'ATU-004', 1),
('1009', 'Hassan', 'Darwish',    'Male',   '0533000009', 7300.00, '2022-02-10', 'AGW-002', 3),
('1010', 'Samir',  'Al-Masri',   'Male',   '0533000010', 8900.00, '2018-08-08', 'MEA-001', 4);

-- ============================================================
-- TECHNICIANS
-- ============================================================
INSERT INTO Technician (ssn, specialization_level) VALUES
('1001', 'Senior'),
('1002', 'Junior'),
('1005', 'Expert'),
('1008', 'Senior');

-- ============================================================
-- TRAFFIC CONTROLLERS
-- ============================================================
INSERT INTO Traffic_Controller
(ssn, recent_medical_exam)
VALUES
('1003', '2025-11-10'),
('1004', '2025-09-20'),
('1007', '2026-01-15'),
('1010', '2025-12-01');

-- ============================================================
-- TEST TYPES
-- ============================================================
INSERT INTO Test
(test_name, max_score, frequency_days)
VALUES
('Engine Performance Test', 100, 90),
('Hydraulic System Check', 100, 180),
('Avionics Calibration', 100, 365),
('Structural Inspection', 100, 730),
('Landing Gear Cycle Test', 100, 90),
('Fuel System Leak Test', 100, 180);

-- ============================================================
-- TECHNICIAN MODEL EXPERTISE
-- ============================================================
INSERT INTO Technician_Model_Expertise
(technician_id, model_id)
VALUES
(1,1),
(1,3),
(2,2),
(2,4),
(3,1),
(3,5),
(4,6);

-- ============================================================
-- TEST EVENTS
-- ============================================================
INSERT INTO Test_Event
(plane_id, technician_id, test_id,
test_date, hours_spent, score)
VALUES
(1,1,1,'2026-03-11',9.0,92),
(1,3,6,'2026-03-12',5.0,88),
(7,1,1,'2026-04-15',8.5,62),
(7,3,2,'2026-04-15',5.5,78),
(5,2,3,'2026-01-14',6.0,90),
(4,4,4,'2026-04-05',18.0,75),
(2,1,1,'2026-03-25',8.5,80),
(8,2,5,'2026-05-01',4.0,70);

-- ============================================================
-- GATE INFO
-- ============================================================
INSERT INTO Gate_Info
(gate_name, terminal, status)
VALUES
('G1', 'Terminal 1', 'ACTIVE'),
('G2', 'Terminal 1', 'ACTIVE'),
('G3', 'Terminal 2', 'ACTIVE'),
('G4', 'Terminal 2', 'MAINTENANCE'),
('VIP1', 'VIP Terminal', 'ACTIVE');

-- ============================================================
-- FLIGHTS
-- ============================================================
INSERT INTO Flight
(flight_no, plane_id, gate_id,
departure_airport, arrival_airport,
departure_time, arrival_time, flight_status)
VALUES
('TK1234',1,1,'Ercan','Istanbul','2026-05-18 06:00:00','2026-05-18 07:30:00','ARRIVED'),
('TK1235',1,2,'Ercan','Istanbul','2026-05-19 06:00:00','2026-05-19 07:30:00','SCHEDULED'),
('PC200',3,3,'Ercan','London','2026-05-18 09:30:00','2026-05-18 13:00:00','DEPARTED'),
('QR900',4,4,'Ercan','Doha','2026-05-17 22:00:00','2026-05-18 03:30:00','ARRIVED'),
('RJ101',6,1,'Ercan','Amman','2026-05-18 11:00:00','2026-05-18 12:30:00','SCHEDULED'),
('SV550',7,2,'Ercan','Jeddah','2026-05-20 16:00:00','2026-05-20 19:40:00','CANCELLED');

-- ============================================================
-- RUNWAYS
-- ============================================================
INSERT INTO Runway
(runway_name, length_meters, runway_status)
VALUES
('Runway A', 3500, 'ACTIVE'),
('Runway B', 2800, 'UNDER MAINTENANCE'),
('Runway C', 4000, 'ACTIVE');

-- ============================================================
-- MAINTENANCE RECORDS
-- ============================================================
INSERT INTO Maintenance_Record
(plane_id, technician_id, maintenance_date,
description, cost)
VALUES
(7,1,'2026-04-15','Engine vibration inspection and repair',45000.00),
(8,2,'2026-05-01','Landing gear hydraulic maintenance',12000.00),
(2,1,'2026-01-05','Engine compressor blade replacement',22000.00),
(1,3,'2026-03-01','Annual full aircraft inspection',18000.00),
(5,2,'2026-01-10','Hydraulic pressure service',6500.00);

-- ============================================================
-- PASSENGERS
-- ============================================================
INSERT INTO Passenger
(first_name, last_name, passport_no, nationality, phone)
VALUES
('Sami', 'Al-Khatib', 'P10001', 'Jordanian', '0556000001'),
('Nader', 'Hammoud', 'P10002', 'Syrian', '0556000002'),
('Rami', 'Yousef', 'P10003', 'Palestinian', '0556000003'),
('Bilal', 'Mansour', 'P10004', 'Lebanese', '0556000004'),
('Karim', 'Salem', 'P10005', 'Egyptian', '0556000005');

-- ============================================================
-- TICKETS
-- ============================================================
INSERT INTO Ticket
(passenger_id, flight_id, seat_no, class_type, price)
VALUES
(1,1,'12A','Economy',350.00),
(2,1,'12B','Economy',350.00),
(3,3,'3C','Business',1200.00),
(4,4,'1A','First Class',2500.00),
(5,5,'15D','Economy',420.00);

-- ============================================================
-- BAGGAGE
-- ============================================================
INSERT INTO Baggage
(ticket_id, weight, baggage_status)
VALUES
(1,23.5,'LOADED'),
(2,18.0,'LOADED'),
(3,30.0,'CHECKED-IN'),
(4,25.0,'LOADED'),
(5,20.0,'PENDING');

-- ============================================================
-- FLIGHT CREW
-- ============================================================
INSERT INTO Flight_Crew
(first_name, last_name, role, airline_id)
VALUES
('Wael', 'Al-Rashid', 'Pilot', 1),
('Bassam', 'Khalil', 'Co-Pilot', 1),
('Ziad', 'Hamdan', 'Cabin Crew', 2),
('Amjad', 'Nasser', 'Cabin Crew', 3),
('Raed', 'Al-Fares', 'Pilot', 4);