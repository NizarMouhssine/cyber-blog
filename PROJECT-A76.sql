CREATE TABLE Branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(255),
  branch_address VARCHAR(255)
);

CREATE TABLE Staff (
  staff_id INT PRIMARY KEY,
  branch_id INT,
  staff_type VARCHAR(255),
  staff_name VARCHAR(255),
  staff_phone_number VARCHAR(20),
  staff_welsh_speaking BOOLEAN,
  FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

CREATE TABLE Activity (
  activity_id INT PRIMARY KEY,
  activity_type VARCHAR(50) NOT NULL,
  activity_duration INT NOT NULL
);

CREATE TABLE Appointment (
  appointment_id INT PRIMARY KEY,
  activity_id INT NOT NULL,
  staff_id INT NOT NULL,
  customer_name VARCHAR(50) NOT NULL,
  appointment_date DATE NOT NULL,
  appointment_time TIME NOT NULL,
  FOREIGN KEY (activity_id) REFERENCES Activity(activity_id),
  FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);


CREATE TABLE Appointment (
  appointment_id INT PRIMARY KEY,
  activity_id INT NOT NULL,
  staff_id INT NOT NULL,
  customer_name VARCHAR(50) NOT NULL,
  appointment_date DATE NOT NULL,
  appointment_time TIME NOT NULL,
  FOREIGN KEY (activity_id) REFERENCES Activity(activity_id),
  FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);


CREATE TABLE Order (
  order_id INT PRIMARY KEY,
  customer_name VARCHAR(255),
  order_date DATE,
  order_status VARCHAR(255),
  order_type VARCHAR(255)
);

CREATE TABLE Order_Item (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_description VARCHAR(255),
    item_quantity INT,
    item_arrival_date DATE,
    FOREIGN KEY (order_id) REFERENCES Order(order_id)
);

INSERT INTO Branch (branch_id, branch_name, branch_address)
VALUES (1, 'Cardiff', '123 Main Street');

INSERT INTO Staff (staff_id, branch_id, staff_type, staff_name, staff_phone_number, staff_welsh_speaking)
VALUES (1, 1, 'receptionist', 'John Doe', '555-555-1234', TRUE);

INSERT INTO Activity (activity_id, activity_type, activity_duration)
VALUES (1, 'Eye Test', 60),
       (2, 'Glasses/Contact Lens Collection and Fitting', 30),
       (3, 'Glasses/Contact Lens Repair and/or Adjustment', 30);


INSERT INTO Appointment (appointment_id, activity_id, staff_id, customer_name, appointment_date, appointment_time)
VALUES (1, 1, 1, 'John Smith', '2023-04-01', '09:00:00'),
       (2, 2, 2, 'Jane Doe', '2023-04-01', '11:00:00'),
       (3, 3, 3, 'Bob Johnson', '2023-04-02', '10:30:00');
       
INSERT INTO Availability (availability_id, staff_id, available_date, available_time)
VALUES
  (1, 1, '2023-03-25', '09:00:00'),
  (2, 1, '2023-03-25', '10:00:00'),
  (3, 2, '2023-03-26', '10:30:00'),
  (4, 3, '2023-03-27', '11:00:00');
  
  
INSERT INTO Order (order_id, customer_name, order_date, order_status, order_type)
VALUES
  (1, 'John Smith', '2023-03-24', 'in progress', 'glasses'),
  (2, 'Jane Doe', '2023-03-23', 'in progress', 'contact lens'),
  (3, 'Bob Johnson', '2023-03-22', 'ready for collection', 'glasses');
  
  
INSERT INTO Order_Item (order_item_id, order_id, item_description, item_quantity, item_arrival_date)
VALUES 
    (1, 1, 'Blue Frame', 1, '2023-04-10'),
    (2, 1, 'Progressive Lenses', 1, '2023-04-10'),
    (3, 2, 'Green Frame', 1, '2023-04-15'),
    (4, 3, 'Contact Lens', 6, '2023-04-20');

