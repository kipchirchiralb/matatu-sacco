CREATE TABLE owners(ID_NO INT, FullName VARCHAR(70), Address VARCHAR(70), Email VARCHAR(70), phone VARCHAR(20), DateRegistered DATE, PRIMARY KEY(ID_NO));

CREATE TABLE vehicles(NumberPlate VARCHAR(10), capacity INT, Model VARCHAR(255), OwnerID INT, LastService DATE, PRIMARY KEY(NumberPlate), FOREIGN KEY(OwnerID) REFERENCES owners(ID_NO));

CREATE TABLE drivers(ID_NO INT, FullName VARCHAR(70), phone VARCHAR(20), email VARCHAR(70), address VARCHAR(70), AssignedVehicle VARCHAR(10), PRIMARY KEY (ID_NO) , FOREIGN KEY(AssignedVehicle) REFERENCES vehicles(NumberPlate));

CREATE TABLE routes(route_id INT, Label VARCHAR(100), PricePerPassenger INT, DistanceKM INT, PRIMARY KEY(route_id));

CREATE TABLE trips(trip_id INT AUTO_INCREMENT, Route INT, Vehicle VARCHAR(10), Departure DATETIME, TripStatus VARCHAR(20), PRIMARY KEY(trip_id), FOREIGN KEY(Route) REFERENCES routes(route_id), FOREIGN KEY(Vehicle) REFERENCES vehicles(NumberPlate));

CREATE TABLE driverPayments(payment_id INT AUTO_INCREMENT, trip_id INT UNIQUE, Amount INT, PaymentStatus VARCHAR(20), dateProcessed DATE DEFAULT CURRENT_DATE, PaymentMethod VARCHAR(20), PRIMARY KEY(payment_id), FOREIGN KEY (trip_id) REFERENCES trips(trip_id));

CREATE TABLE ownerPayments(payment_id INT AUTO_INCREMENT, trip_id INT UNIQUE, Amount INT, PaymentStatus VARCHAR(20), dateProcessed DATE DEFAULT CURRENT_DATE, PaymentMethod VARCHAR(20), PRIMARY KEY(payment_id), FOREIGN KEY (trip_id) REFERENCES trips(trip_id));

INSERT INTO owners (ID_NO, FullName, Address, Email, phone, DateRegistered)
VALUES
  (12345678, 'John Doe', 'Eldoret', 'johndoe@example.com', '0712345678', '2023-01-01'),
  (23456789, 'Jane Doe', 'Kisumu', 'janedoe@example.com', '0723456789', '2023-02-15'),
  (34567890, 'Peter Smith', 'Nairobi', 'petersmith@example.com', '0734567890', '2023-03-10'),
  (45678901, 'Mary Brown', 'Kakamega', 'marybrown@example.com', '0745678901', '2023-04-05'),
  (56789012, 'David Johnson', 'Busia', 'davidjohnson@example.com', '0756789012', '2023-05-20');

INSERT INTO vehicles (NumberPlate, capacity, Model, OwnerID, LastService)
VALUES
  ('KAA 123A', 33, 'Toyota Hiace', 12345678, '2023-04-15'),
  ('KBA 456B', 28, 'Nissan Matatu', 23456789, '2023-03-20'),
  ('KCA 789C', 30, 'Ford Transit', 34567890, '2023-05-10'),
  ('KDA 012D', 35, 'Mercedes Benz', 45678901, '2023-02-25'),
  ('KEA 345E', 29, 'Mitsubishi Fuso', 56789012, '2023-06-05');

INSERT INTO drivers (ID_NO, FullName, phone, email, address, AssignedVehicle)
VALUES
  (98765432, 'James White', '0765432109', 'jameswhite@example.com', 'Eldoret', 'KAA 123A'),
  (87654321, 'Sarah Black', '0754321098', 'sarahblack@example.com', 'Kisumu', 'KBA 456B'),
  (76543210, 'Michael Green', '0743210987', 'michaelgreen@example.com', 'Nairobi', 'KCA 789C'),
  (65432109, 'Emily Brown', '0732109876', 'emilybrown@example.com', 'Kakamega', 'KDA 012D'),
  (54321098, 'David Blue', '0721098765', 'davidblue@example.com', 'Busia', 'KEA 345E');

INSERT INTO routes (route_id, Label, PricePerPassenger, DistanceKM)
VALUES
  (1, 'Eldoret - Kisumu', 500, 150),
  (2, 'Eldoret - Nairobi', 1000, 350),
  (3, 'Eldoret - Kakamega', 300, 80),
  (4, 'Eldoret - Busia', 400, 120),
  (5, 'Eldoret - Kisii', 600, 200);

INSERT INTO trips (Route, Vehicle, Departure, TripStatus)
VALUES
  (1, 'KAA 123A', '2023-06-01 08:00:00', 'Completed'),
  (2, 'KBA 456B', '2023-06-02 10:30:00', 'Ongoing'),
  (3, 'KCA 789C', '2023-06-03 12:00:00', 'Scheduled'),
  (4, 'KDA 012D', '2023-06-04 14:30:00', 'Cancelled'),
  (5, 'KEA 345E', '2023-06-05 16:00:00', 'Completed');

INSERT INTO trips (Route, Vehicle, Departure, TripStatus)
VALUES
  (1, 'KAA 123A', '2024-01-15 08:00:00', 'Completed'),
  (2, 'KBA 456B', '2024-01-22 10:30:00', 'Ongoing'),
  (3, 'KCA 789C', '2024-02-01 12:00:00', 'Scheduled'),
  (4, 'KDA 012D', '2024-02-10 14:30:00', 'Cancelled'),
  (5, 'KEA 345E', '2024-02-18 16:00:00', 'Completed'),
  (1, 'KAA 123A', '2024-03-05 08:00:00', 'Completed'),
  (2, 'KBA 456B', '2024-03-12 10:30:00', 'Ongoing'),
  (3, 'KCA 789C', '2024-03-20 12:00:00', 'Scheduled'),
  (4, 'KDA 012D', '2024-03-28 14:30:00', 'Cancelled'),
  (5, 'KEA 345E', '2024-04-05 16:00:00', 'Completed'),
  (1, 'KAA 123A', '2024-04-13 08:00:00', 'Completed'),
  (2, 'KBA 456B', '2024-04-20 10:30:00', 'Ongoing'),
  (3, 'KCA 789C', '2024-04-28 12:00:00', 'Scheduled'),
  (4, 'KDA 012D', '2024-04-07 14:30:00', 'Cancelled'),
  (5, 'KEA 345E', '2024-04-15 16:00:00', 'Completed');
