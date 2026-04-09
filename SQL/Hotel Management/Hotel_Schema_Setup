CREATION OF TABLES:

CREATE TABLE users (
    user_id VARCHAR(50),
    name VARCHAR(50),
    phone_number VARCHAR(15),
    mail_id VARCHAR(100),
    billing_address TEXT
);

CREATE TABLE bookings (
    booking_id VARCHAR(50),
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50)
);

CREATE TABLE items (
    item_id VARCHAR(50),
    item_name VARCHAR(100),
    item_rate INT
);

CREATE TABLE booking_commercials (
    id VARCHAR(50),
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity FLOAT
);




INSERTION OF DATA:

users:

INSERT INTO users (user_id, name, phone_number, mail_id, billing_address) VALUES
('u1', 'John Doe', '9876543210', 'john@example.com', 'Street A, City X'),
('u2', 'Alice Smith', '9123456780', 'alice@example.com', 'Street B, City Y'),
('u3', 'Bob Lee', '9988776655', 'bob@example.com', 'Street C, City Z');


bookings:

INSERT INTO bookings (booking_id, booking_date, room_no, user_id) VALUES
('b1', '2021-10-05 10:00:00', '101', 'u1'),
('b2', '2021-10-20 12:00:00', '102', 'u2'),
('b3', '2021-11-10 14:00:00', '103', 'u1'),
('b4', '2021-11-15 16:00:00', '104', 'u3'),
('b5', '2021-09-25 09:00:00', '105', 'u2');


items:

INSERT INTO items (item_id, item_name, item_rate) VALUES
('i1', 'Tawa Paratha', 50),
('i2', 'Mix Veg', 120),
('i3', 'Tea', 20),
('i4', 'Coffee', 40);


booking_commercials:

INSERT INTO booking_commercials 
(id, booking_id, bill_id, bill_date, item_id, item_quantity) VALUES

-- October Bills
('c1', 'b1', 'bill1', '2021-10-05 11:00:00', 'i1', 5),
('c2', 'b1', 'bill1', '2021-10-05 11:00:00', 'i2', 3),

('c3', 'b2', 'bill2', '2021-10-20 13:00:00', 'i2', 10),
('c4', 'b2', 'bill2', '2021-10-20 13:00:00', 'i3', 10),

-- November Bills
('c5', 'b3', 'bill3', '2021-11-10 15:00:00', 'i1', 8),
('c6', 'b3', 'bill3', '2021-11-10 15:00:00', 'i4', 5),

('c7', 'b4', 'bill4', '2021-11-15 17:00:00', 'i2', 6),
('c8', 'b4', 'bill4', '2021-11-15 17:00:00', 'i3', 4),

-- September Bills
('c9', 'b5', 'bill5', '2021-09-25 10:00:00', 'i1', 2),
('c10', 'b5', 'bill5', '2021-09-25 10:00:00', 'i3', 3);
