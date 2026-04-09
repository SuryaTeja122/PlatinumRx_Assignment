CREATION OF TABLES:

CREATE TABLE clinics (
    cid TEXT PRIMARY KEY,
    clinic_name TEXT,
    city TEXT,
    state TEXT,
    country TEXT
);

CREATE TABLE customer (
    uid TEXT PRIMARY KEY,
    name TEXT,
    mobile TEXT
);

CREATE TABLE clinic_sales (
    oid TEXT PRIMARY KEY,
    uid TEXT,
    cid TEXT,
    amount INTEGER,
    datetime TEXT,
    sales_channel TEXT
);

CREATE TABLE expenses (
    eid TEXT PRIMARY KEY,
    cid TEXT,
    description TEXT,
    amount INTEGER,
    datetime TEXT
);




INSERTION OF DATA:

Customers:

INSERT INTO customer VALUES
('u1', 'John Doe', '9876543210'),
('u2', 'Alice Smith', '9123456780'),
('u3', 'Bob Lee', '9988776655'),
('u4', 'David Kim', '9012345678');


Clinics:

INSERT INTO clinics VALUES
('c1', 'City Care', 'Hyderabad', 'Telangana', 'India'),
('c2', 'Health Plus', 'Hyderabad', 'Telangana', 'India'),
('c3', 'Wellness Clinic', 'Bangalore', 'Karnataka', 'India'),
('c4', 'LifeCare', 'Chennai', 'Tamil Nadu', 'India');


Clinic Sales:

INSERT INTO clinic_sales VALUES
('o1', 'u1', 'c1', 5000, '2021-09-10 10:00:00', 'online'),
('o2', 'u2', 'c1', 7000, '2021-09-15 12:00:00', 'offline'),
('o3', 'u3', 'c2', 3000, '2021-09-20 14:00:00', 'online'),
('o4', 'u1', 'c3', 8000, '2021-09-25 16:00:00', 'app'),
('o5', 'u2', 'c2', 6000, '2021-10-05 11:00:00', 'online'),
('o6', 'u3', 'c3', 4000, '2021-10-10 13:00:00', 'offline'),
('o7', 'u4', 'c4', 9000, '2021-10-15 15:00:00', 'app'),
('o8', 'u1', 'c1', 10000, '2021-11-01 10:00:00', 'online'),
('o9', 'u2', 'c2', 2000, '2021-11-03 12:00:00', 'offline');


Expenses:

INSERT INTO expenses VALUES
('e1', 'c1', 'Medicines', 2000, '2021-09-10 09:00:00'),
('e2', 'c1', 'Staff Salary', 3000, '2021-09-15 09:00:00'),
('e3', 'c2', 'Equipment', 1500, '2021-09-20 09:00:00'),
('e4', 'c3', 'Maintenance', 2500, '2021-09-25 09:00:00'),
('e5', 'c2', 'Medicines', 2000, '2021-10-05 09:00:00'),
('e6', 'c3', 'Staff Salary', 3000, '2021-10-10 09:00:00'),
('e7', 'c4', 'Equipment', 4000, '2021-10-15 09:00:00'),
('e8', 'c1', 'Maintenance', 3500, '2021-11-01 09:00:00');







