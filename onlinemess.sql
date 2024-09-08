/*Create Database*/

CREATE DATABASE mess_operations;
USE mess_operations;



/*Create Tables*/

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contact_number VARCHAR(15),
    role ENUM('student', 'staff', 'admin') NOT NULL
);



CREATE TABLE Meals (
    meal_id INT AUTO_INCREMENT PRIMARY KEY,
    meal_name VARCHAR(50) NOT NULL,
    meal_time TIME NOT NULL
);



CREATE TABLE Menu (
    menu_id INT AUTO_INCREMENT PRIMARY KEY,
    meal_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (meal_id) REFERENCES Meals(meal_id)
);



CREATE TABLE Subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    meal_id INT NOT NULL,
    subscription_start_date DATE NOT NULL,
    subscription_end_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (meal_id) REFERENCES Meals(meal_id)
);



CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);



CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    meal_id INT NOT NULL,
    date DATE NOT NULL,
    status ENUM('present', 'absent') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (meal_id) REFERENCES Meals(meal_id)
);


/* Enter Sample Data */

INSERT INTO Users (name, email, contact_number, role) VALUES
('John Doe', 'john@example.com', '9876543210', 'student'),
('Jane Smith', 'jane@example.com', '8765432109', 'staff'),
('Mike Johnson', 'mike@example.com', '7654321098', 'admin');



INSERT INTO Meals (meal_name, meal_time) VALUES
('Breakfast', '08:00:00'),
('Lunch', '13:00:00'),
('Dinner', '19:00:00');



INSERT INTO Menu (meal_id, item_name, date) VALUES
(1, 'Poha and Tea', '2024-09-10'),
(2, 'Dal and Rice', '2024-09-10'),
(3, 'Paneer Butter Masala and Roti', '2024-09-10');



INSERT INTO Subscriptions (user_id, meal_id, subscription_start_date, subscription_end_date) VALUES
(1, 1, '2024-09-01', '2024-09-30'),
(2, 2, '2024-09-01', '2024-09-30'),
(1, 3, '2024-09-01', '2024-09-30');



INSERT INTO Payments (user_id, amount, payment_date) VALUES
(1, 1500.00, '2024-09-01'),
(2, 1200.00, '2024-09-01');



INSERT INTO Attendance (user_id, meal_id, date, status) VALUES
(1, 1, '2024-09-10', 'present'),
(2, 2, '2024-09-10', 'absent'),
(1, 3, '2024-09-10', 'present');

