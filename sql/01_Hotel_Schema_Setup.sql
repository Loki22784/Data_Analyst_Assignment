CREATE TABLE users (
  user_id VARCHAR(120) NOT NULL PRIMARY KEY,
  name VARCHAR(120),
  phone_number VARCHAR(10),
  mail_id VARCHAR(120),
  billing_address VARCHAR(120)
);

CREATE TABLE bookings (
  booking_id VARCHAR(120) NOT NULL PRIMARY KEY,
  booking_date DATE,
  room_no VARCHAR(120),
  user_id VARCHAR(120),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE booking_commercials (
  id VARCHAR(120) NOT NULL PRIMARY KEY,
  booking_id VARCHAR(120),
  bill_id VARCHAR(120),
  bill_date DATE,
  item_id VARCHAR(120),
  item_quantity INT,
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE,
  FOREIGN KEY (item_id) REFERENCES items(item_id) ON DELETE CASCADE
);

CREATE TABLE items (
  item_id VARCHAR(120) NOT NULL PRIMARY KEY,
  item_name VARCHAR(120),
  item_rate INT
);


INSERT INTO users (user_id, name, phone_number, mail_id, billing_address) VALUES
('USR001', 'John Doe', '9876543210', 'john@example.com', 'Vizag'),
('USR002', 'Alice Smith', '9876543211', 'alice@example.com', 'Hyderabad'),
('USR003', 'Bob Johnson', '9876543212', 'bob@example.com', 'Chennai'),
('USR004', 'David Lee', '9876543213', 'david@example.com', 'Bangalore'),
('USR005', 'Emma Watson', '9876543214', 'emma@example.com', 'Mumbai'),
('USR006', 'Chris Evans', '9876543215', 'chris@example.com', 'Delhi'),
('USR007', 'Sophia Brown', '9876543216', 'sophia@example.com', 'Pune'),
('USR008', 'Daniel Craig', '9876543217', 'daniel@example.com', 'Kolkata'),
('USR009', 'Olivia Green', '9876543218', 'olivia@example.com', 'Goa'),
('USR010', 'James Bond', '9876543219', 'james@example.com', 'Vizag');

INSERT INTO bookings (booking_id, booking_date, room_no, user_id) VALUES
('BK001', '2021-09-10 10:30:00', 'RM101', 'USR001'),
('BK002', '2021-10-05 12:00:00', 'RM102', 'USR002'),
('BK003', '2021-10-15 15:20:00', 'RM103', 'USR003'),
('BK004', '2021-11-01 09:45:00', 'RM104', 'USR004'),
('BK005', '2021-11-12 18:10:00', 'RM105', 'USR005'),
('BK006', '2021-11-20 14:00:00', 'RM106', 'USR006'),
('BK007', '2021-12-01 11:15:00', 'RM107', 'USR007'),
('BK008', '2021-12-10 17:30:00', 'RM108', 'USR008'),
('BK009', '2021-09-25 08:20:00', 'RM109', 'USR009'),
('BK010', '2021-11-25 20:00:00', 'RM110', 'USR010');

INSERT INTO items (item_id, item_name, item_rate) VALUES
  ('ITM001', 'Tawa Paratha', 18),
  ('ITM002', 'Mix Veg', 89),
  ('ITM003', 'Paneer Butter Masala', 150),
  ('ITM004', 'Fried Rice', 120),
  ('ITM005', 'Coffee', 40),
  ('ITM006', 'Tea', 20),
  ('ITM007', 'Ice Cream', 60),
  ('ITM008', 'Juice', 50),
  ('ITM009', 'Pizza', 250),
  ('ITM010', 'Burger', 180);

INSERT INTO booking_commercials
(id, booking_id, bill_id, bill_date, item_id, item_quantity)
VALUES
('BC001', 'BK001', 'BILL001', '2021-09-10 12:00:00', 'ITM001', 3),
('BC002', 'BK002', 'BILL002', '2021-10-05 13:00:00', 'ITM003', 8),
('BC003', 'BK003', 'BILL003', '2021-10-15 16:00:00', 'ITM009', 5),
('BC004', 'BK004', 'BILL004', '2021-11-01 10:00:00', 'ITM004', 2),
('BC005', 'BK005', 'BILL005', '2021-11-12 19:00:00', 'ITM010', 6),
('BC006', 'BK006', 'BILL006', '2021-11-20 15:00:00', 'ITM002', 4),
('BC007', 'BK007', 'BILL007', '2021-12-01 12:00:00', 'ITM007', 5),
('BC008', 'BK008', 'BILL008', '2021-12-10 18:00:00', 'ITM005', 10),
('BC009', 'BK009', 'BILL009', '2021-09-25 09:00:00', 'ITM006', 12),
('BC010', 'BK010', 'BILL010', '2021-11-25 21:00:00', 'ITM009', 6);
