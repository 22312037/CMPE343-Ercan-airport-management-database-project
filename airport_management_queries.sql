-- Query 1: Display all employee full names and their union membership numbers.
SELECT CONCAT(first_name, ' ', last_name) AS full_name, union_membership_no
FROM Employee;



-- Query 2: Display the first name, last name, and length of the last name for all technicians.
SELECT Employee.first_name, Employee.last_name, LENGTH(Employee.last_name) AS last_name_length
FROM Employee
JOIN Technician ON Employee.ssn = Technician.ssn;

-- Query 3: Display the plane number and capacity rounded to the nearest hundred.
SELECT Airplane.plane_no, Airplane.capacity, ROUND(Airplane.capacity, -2) AS rounded_capacity
FROM Airplane;



-- Query 4: Display the ticket price truncated to no decimal places.
SELECT Ticket.ticket_id, Ticket.price, TRUNCATE(Ticket.price, 0) AS price_no_cents
FROM Ticket;

-- Query 5: Display all employees hired after January 1, 2018.
SELECT Employee.first_name, Employee.last_name, Employee.hire_date
FROM Employee
WHERE Employee.hire_date > '2018-01-01';

-- Query 6: Display the flight number and departure time, and show the month of departure.
SELECT Flight.flight_no, Flight.departure_time, MONTH(Flight.departure_time) AS departure_month
FROM Flight;



-- Query 7: Display the plane number and test score, adding 10 points as a bonus score.
SELECT Airplane.plane_no, Test_Event.score, Test_Event.score + 10 AS bonus_score
FROM Test_Event
JOIN Airplane ON Test_Event.plane_id = Airplane.plane_id;

-- Query 8: Display all flights along with their assigned gate name, including flights without a gate.
SELECT Flight.flight_no, Flight.flight_status, Gate_Info.gate_name
FROM Flight
LEFT JOIN Gate_Info ON Flight.gate_id = Gate_Info.gate_id;



-- Query 9: Display all gates along with any flights assigned to them, including gates with no flights.
SELECT Gate_Info.gate_name, Flight.flight_no, Flight.flight_status
FROM Flight
RIGHT JOIN Gate_Info ON Flight.gate_id = Gate_Info.gate_id;



-- Query 10: Display all flights that have tickets sold (assigned passengers).
SELECT DISTINCT Flight.flight_no, Flight.departure_airport, Flight.arrival_airport
FROM Flight
INNER JOIN Ticket ON Flight.flight_id = Ticket.flight_id;



-- Query 11: Find all airplanes that have never undergone any test.
SELECT Airplane.plane_no, Airplane.status
FROM Airplane
LEFT JOIN Test_Event ON Airplane.plane_id = Test_Event.plane_id
WHERE Test_Event.event_id IS NULL;


-- Query 12: Display all flights whose flight number starts with 'TK' and have status 'SCHEDULED'.
SELECT Flight.flight_no, Flight.departure_time, Flight.flight_status
FROM Flight
WHERE Flight.flight_no LIKE 'TK%' AND Flight.flight_status = 'SCHEDULED';



-- Query 13: Calculate the average test score for each plane.
SELECT Airplane.plane_no, AVG(Test_Event.score) AS average_test_score
FROM Test_Event
JOIN Airplane ON Test_Event.plane_id = Airplane.plane_id
GROUP BY Airplane.plane_no;



-- Query 14: Count how many flights each plane has been assigned to.
SELECT Airplane.plane_no, COUNT(Flight.flight_id) AS total_flights
FROM Airplane
LEFT JOIN Flight ON Airplane.plane_id = Flight.plane_id
GROUP BY Airplane.plane_no;



-- Query 15: Find the highest paid employee in each union.
SELECT Union_Info.union_name, Employee.first_name, Employee.last_name, Employee.salary
FROM Employee
JOIN Union_Info ON Employee.union_id = Union_Info.union_id
WHERE (Employee.union_id, Employee.salary) IN (
    SELECT Employee.union_id, MAX(Employee.salary)
    FROM Employee
    WHERE Employee.union_id IS NOT NULL
    GROUP BY Employee.union_id
);