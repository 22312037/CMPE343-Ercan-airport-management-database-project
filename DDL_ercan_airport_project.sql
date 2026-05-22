CREATE DATABASE ercan_airport_project;
USE ercan_airport_project;
-- =====================================================
-- 1. AIRLINE
-- =====================================================
CREATE TABLE Airline (
    airline_id INT AUTO_INCREMENT PRIMARY KEY,
    airline_name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50),
    founded_year INT
);

-- =====================================================
-- 2. PLANE MODEL
-- =====================================================
CREATE TABLE Plane_Model (
    model_id INT AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100),
    max_range INT CHECK (max_range > 0),
    fuel_capacity INT
);

-- =====================================================
-- 3. AIRPLANE
-- =====================================================
CREATE TABLE Airplane (
    plane_id INT AUTO_INCREMENT PRIMARY KEY,
    plane_no VARCHAR(20) NOT NULL UNIQUE,
    model_id INT NOT NULL,
    airline_id INT NOT NULL,
    capacity INT CHECK (capacity > 0),
    manufacture_year INT,
    status VARCHAR(50),

    FOREIGN KEY (model_id)
    REFERENCES Plane_Model(model_id),

    FOREIGN KEY (airline_id)
    REFERENCES Airline(airline_id)
);

-- =====================================================
-- 4. HANGAR
-- =====================================================
CREATE TABLE Hangar (
    hangar_id INT AUTO_INCREMENT PRIMARY KEY,
    hangar_name VARCHAR(50) NOT NULL,
    location VARCHAR(100),
    capacity INT CHECK (capacity > 0)
);

-- =====================================================
-- 5. HANGAR HISTORY
-- =====================================================
CREATE TABLE Hangar_History (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    plane_id INT NOT NULL,
    hangar_id INT NOT NULL,
    in_datetime DATETIME NOT NULL,
    out_datetime DATETIME,

    FOREIGN KEY (plane_id)
    REFERENCES Airplane(plane_id),

    FOREIGN KEY (hangar_id)
    REFERENCES Hangar(hangar_id)
);

-- =====================================================
-- 6. UNION INFO
-- =====================================================
CREATE TABLE Union_Info (
    union_id INT AUTO_INCREMENT PRIMARY KEY,
    union_name VARCHAR(100) NOT NULL,
    union_address VARCHAR(150),
    union_phone VARCHAR(20)
);

-- =====================================================
-- 7. EMPLOYEE
-- =====================================================
CREATE TABLE Employee (
    ssn VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    phone VARCHAR(20),
    salary DECIMAL(10,2),
    hire_date DATE,

    union_membership_no VARCHAR(50) UNIQUE,
    union_id INT,

    FOREIGN KEY (union_id)
    REFERENCES Union_Info(union_id)
);

-- =====================================================
-- 8. TECHNICIAN
-- =====================================================
CREATE TABLE Technician (
    technician_id INT AUTO_INCREMENT PRIMARY KEY,
    ssn VARCHAR(20) NOT NULL,
    specialization_level VARCHAR(50),

    FOREIGN KEY (ssn)
    REFERENCES Employee(ssn)
);

-- =====================================================
-- 9. TRAFFIC CONTROLLER
-- =====================================================
CREATE TABLE Traffic_Controller (
    controller_id INT AUTO_INCREMENT PRIMARY KEY,
    ssn VARCHAR(20) NOT NULL,
    recent_medical_exam DATE,

    FOREIGN KEY (ssn)
    REFERENCES Employee(ssn)
);

-- =====================================================
-- 10. TEST
-- =====================================================
CREATE TABLE Test (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    test_name VARCHAR(100),
    max_score INT,
    frequency_days INT
);

-- =====================================================
-- 11. TEST EVENT
-- =====================================================
CREATE TABLE Test_Event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    plane_id INT NOT NULL,
    technician_id INT NOT NULL,
    test_id INT NOT NULL,
    test_date DATE,
    hours_spent DECIMAL(5,2),
    score INT CHECK (score BETWEEN 0 AND 100),

    FOREIGN KEY (plane_id)
    REFERENCES Airplane(plane_id),

    FOREIGN KEY (technician_id)
    REFERENCES Technician(technician_id),

    FOREIGN KEY (test_id)
    REFERENCES Test(test_id)
);

-- =====================================================
-- 12. TECHNICIAN MODEL EXPERTISE
-- =====================================================
CREATE TABLE Technician_Model_Expertise (
    technician_id INT,
    model_id INT,

    PRIMARY KEY (technician_id, model_id),

    FOREIGN KEY (technician_id)
    REFERENCES Technician(technician_id),

    FOREIGN KEY (model_id)
    REFERENCES Plane_Model(model_id)
);

-- =====================================================
-- 13. GATE INFO
-- =====================================================
CREATE TABLE Gate_Info (
    gate_id INT AUTO_INCREMENT PRIMARY KEY,
    gate_name VARCHAR(20),
    terminal VARCHAR(20),
    status VARCHAR(30)
);

-- =====================================================
-- 14. FLIGHT
-- =====================================================
CREATE TABLE Flight (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_no VARCHAR(20) NOT NULL UNIQUE,
    plane_id INT NOT NULL,
    gate_id INT,
    departure_airport VARCHAR(100),
    arrival_airport VARCHAR(100),
    departure_time DATETIME,
    arrival_time DATETIME,
    flight_status VARCHAR(50),

    FOREIGN KEY (plane_id)
    REFERENCES Airplane(plane_id),

    FOREIGN KEY (gate_id)
    REFERENCES Gate_Info(gate_id)
);

-- =====================================================
-- 15. RUNWAY
-- =====================================================
CREATE TABLE Runway (
    runway_id INT AUTO_INCREMENT PRIMARY KEY,
    runway_name VARCHAR(50),
    length_meters INT,
    runway_status VARCHAR(50)
);

-- =====================================================
-- 16. MAINTENANCE RECORD
-- =====================================================
CREATE TABLE Maintenance_Record (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    plane_id INT NOT NULL,
    technician_id INT NOT NULL,
    maintenance_date DATE,
    description TEXT,
    cost DECIMAL(10,2),

    FOREIGN KEY (plane_id)
    REFERENCES Airplane(plane_id),

    FOREIGN KEY (technician_id)
    REFERENCES Technician(technician_id)
);

-- =====================================================
-- 17. PASSENGER
-- =====================================================
CREATE TABLE Passenger (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    passport_no VARCHAR(30) UNIQUE,
    nationality VARCHAR(50),
    phone VARCHAR(20)
);

-- =====================================================
-- 18. TICKET
-- =====================================================
CREATE TABLE Ticket (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT NOT NULL,
    flight_id INT NOT NULL,
    seat_no VARCHAR(10),
    class_type VARCHAR(20),
    price DECIMAL(10,2),

    FOREIGN KEY (passenger_id)
    REFERENCES Passenger(passenger_id),

    FOREIGN KEY (flight_id)
    REFERENCES Flight(flight_id)
);

-- =====================================================
-- 19. BAGGAGE
-- =====================================================
CREATE TABLE Baggage (
    baggage_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT NOT NULL,
    weight DECIMAL(5,2),
    baggage_status VARCHAR(50),

    FOREIGN KEY (ticket_id)
    REFERENCES Ticket(ticket_id)
);

-- =====================================================
-- 20. FLIGHT CREW
-- =====================================================
CREATE TABLE Flight_Crew (
    crew_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role VARCHAR(50),
    airline_id INT,

    FOREIGN KEY (airline_id)
    REFERENCES Airline(airline_id)
);
