
CREATE DATABASE IF NOT EXISTS SkyBookDB;

CREATE TABLE Airports (
    Airport_Code VARCHAR(5) PRIMARY KEY,
    Airport_Name VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Flights (
    Flight_ID INT PRIMARY KEY,
    Flight_Number VARCHAR(10),
    Airline VARCHAR(50),
    Origin_Code VARCHAR(5),
    Destination_Code VARCHAR(5),
    Departure_Date DATE,
    Departure_Time TIME,
    Arrival_Time TIME,
    Duration_Hours DECIMAL(4,2),
    Base_Fare DECIMAL(10,2),
    FOREIGN KEY (Origin_Code) REFERENCES Airports(Airport_Code),
    FOREIGN KEY (Destination_Code) REFERENCES Airports(Airport_Code)
);

CREATE TABLE Passengers (
    Passenger_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Contact VARCHAR(15),
    Email VARCHAR(100),
    Nationality VARCHAR(50)
);

CREATE TABLE Bookings (
    Booking_ID INT PRIMARY KEY,
    Passenger_ID INT,
    Flight_ID INT,
    Booking_Date DATE,
    Seat_Class VARCHAR(20),
    Seat_Number VARCHAR(10),
    Status VARCHAR(20),
    FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID),
    FOREIGN KEY (Flight_ID) REFERENCES Flights(Flight_ID)
);

CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Booking_ID INT,
    Amount DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Payment_Status VARCHAR(20),
    Payment_Date DATE,
    FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);
INSERT INTO Airports VALUES
('DEL','Indira Gandhi International','New Delhi','India'),
('BOM','Chhatrapati Shivaji Maharaj Intl','Mumbai','India'),
('BLR','Kempegowda International','Bengaluru','India'),
('MAA','Chennai International','Chennai','India'),
('CCU','Netaji Subhas Chandra Bose Intl','Kolkata','India'),
('HYD','Rajiv Gandhi International','Hyderabad','India'),
('PNQ','Pune Airport','Pune','India'),
('AMD','Sardar Vallabhbhai Patel Intl','Ahmedabad','India'),
('GOI','Goa Dabolim Airport','Goa','India'),
('COK','Cochin International','Kochi','India');

INSERT INTO Flights VALUES
(101,'6E-202','IndiGo','DEL','BOM','2024-02-01','06:00:00','08:10:00',2.17,4500.00),
(102,'AI-505','Air India','BOM','BLR','2024-02-01','09:30:00','11:00:00',1.50,3800.00),
(103,'UK-810','Vistara','DEL','BLR','2024-02-02','07:00:00','09:45:00',2.75,5200.00),
(104,'SG-115','SpiceJet','BLR','MAA','2024-02-02','12:00:00','13:10:00',1.17,2800.00),
(105,'6E-330','IndiGo','MAA','CCU','2024-02-03','14:00:00','16:20:00',2.33,4700.00),
(106,'AI-620','Air India','CCU','DEL','2024-02-03','17:00:00','19:30:00',2.50,5100.00),
(107,'UK-450','Vistara','DEL','HYD','2024-02-04','08:00:00','10:00:00',2.00,4300.00),
(108,'SG-275','SpiceJet','HYD','PNQ','2024-02-04','11:30:00','13:00:00',1.50,3200.00),
(109,'6E-540','IndiGo','PNQ','AMD','2024-02-05','15:00:00','16:15:00',1.25,2600.00),
(110,'AI-390','Air India','AMD','GOI','2024-02-05','18:00:00','19:30:00',1.50,3600.00),
(111,'UK-710','Vistara','GOI','COK','2024-02-06','09:00:00','10:20:00',1.33,3100.00),
(112,'SG-160','SpiceJet','COK','BOM','2024-02-06','13:00:00','15:00:00',2.00,4900.00),
(113,'6E-800','IndiGo','BOM','DEL','2024-02-07','07:30:00','09:40:00',2.17,4500.00),
(114,'AI-215','Air India','BLR','DEL','2024-02-07','16:00:00','18:45:00',2.75,5200.00),
(115,'UK-330','Vistara','HYD','BOM','2024-02-08','10:00:00','11:30:00',1.50,3900.00);

INSERT INTO Passengers VALUES
(1,'Aarav Mehta',29,'M','9876500001','aarav.mehta@gmail.com','Indian'),
(2,'Priya Nair',34,'F','9876500002','priya.nair@yahoo.com','Indian'),
(3,'Rohan Kapoor',41,'M','9876500003','rohan.kapoor@gmail.com','Indian'),
(4,'Sneha Iyer',26,'F','9876500004','sneha.iyer@outlook.com','Indian'),
(5,'Vivaan Shah',38,'M','9876500005','vivaan.shah@gmail.com','Indian'),
(6,'Anika Verma',31,'F','9876500006','anika.verma@yahoo.com','Indian'),
(7,'Kabir Joshi',45,'M','9876500007','kabir.joshi@gmail.com','Indian'),
(8,'Diya Reddy',28,'F','9876500008','diya.reddy@hotmail.com','Indian'),
(9,'Aditya Rao',52,'M','9876500009','aditya.rao@gmail.com','Indian'),
(10,'Meera Pillai',33,'F','9876500010','meera.pillai@yahoo.com','Indian'),
(11,'Arjun Malhotra',24,'M','9876500011','arjun.malhotra@gmail.com','Indian'),
(12,'Ishita Sen',39,'F','9876500012','ishita.sen@gmail.com','Indian'),
(13,'Dhruv Bose',47,'M','9876500013','dhruv.bose@outlook.com','Indian'),
(14,'Kavya Chatterjee',30,'F','9876500014','kavya.chatterjee@gmail.com','Indian'),
(15,'Rahul Desai',55,'M','9876500015','rahul.desai@yahoo.com','Indian'),
(16,'Neha Agarwal',27,'F','9876500016','neha.agarwal@gmail.com','Indian'),
(17,'Karan Menon',36,'M','9876500017','karan.menon@outlook.com','Indian'),
(18,'Pooja Krishnan',42,'F','9876500018','pooja.krishnan@gmail.com','Indian'),
(19,'Siddharth Rao',32,'M','9876500019','siddharth.rao@yahoo.com','Indian'),
(20,'Tanvi Bhatt',25,'F','9876500020','tanvi.bhatt@gmail.com','Indian');

INSERT INTO Bookings VALUES
(7001,1,101,'2024-01-20','Economy','12A','Confirmed'),
(7002,2,101,'2024-01-20','Business','1A','Confirmed'),
(7003,3,102,'2024-01-21','Economy','14C','Confirmed'),
(7004,4,103,'2024-01-21','Economy','10B','Confirmed'),
(7005,5,103,'2024-01-22','Business','2A','Confirmed'),
(7006,6,104,'2024-01-22','Economy','8D','Confirmed'),
(7007,7,105,'2024-01-23','Economy','15A','Confirmed'),
(7008,8,106,'2024-01-23','Economy','11C','Cancelled'),
(7009,9,107,'2024-01-24','Business','1B','Confirmed'),
(7010,10,108,'2024-01-24','Economy','9A','Confirmed'),
(7011,1,109,'2024-01-25','Economy','13B','Confirmed'),
(7012,11,110,'2024-01-25','Economy','7C','Confirmed'),
(7013,12,111,'2024-01-26','Business','3A','Confirmed'),
(7014,13,112,'2024-01-26','Economy','16D','Confirmed'),
(7015,14,113,'2024-01-27','Economy','12B','Confirmed'),
(7016,15,114,'2024-01-27','Economy','10A','Cancelled'),
(7017,16,115,'2024-01-28','Business','2B','Confirmed'),
(7018,2,105,'2024-01-28','Economy','14A','Confirmed'),
(7019,17,101,'2024-01-29','Economy','17C','Confirmed'),
(7020,18,102,'2024-01-29','Business','1C','Confirmed'),
(7021,19,103,'2024-01-30','Economy','11A','Confirmed'),
(7022,20,104,'2024-01-30','Economy','9B','Confirmed'),
(7023,3,106,'2024-01-31','Economy','15C','Confirmed'),
(7024,7,110,'2024-01-31','Business','3B','Confirmed'),
(7025,9,112,'2024-02-01','Economy','18A','Confirmed');

INSERT INTO Payments VALUES
(4001,7001,4500.00,'Credit Card','Paid','2024-01-20'),
(4002,7002,6750.00,'UPI','Paid','2024-01-20'),
(4003,7003,3800.00,'Debit Card','Paid','2024-01-21'),
(4004,7004,5200.00,'Credit Card','Paid','2024-01-21'),
(4005,7005,7800.00,'Net Banking','Paid','2024-01-22'),
(4006,7006,2800.00,'UPI','Paid','2024-01-22'),
(4007,7007,4700.00,'Credit Card','Paid','2024-01-23'),
(4008,7008,5100.00,'Debit Card','Refunded','2024-01-23'),
(4009,7009,6450.00,'Credit Card','Paid','2024-01-24'),
(4010,7010,3200.00,'UPI','Paid','2024-01-24'),
(4011,7011,2600.00,'Net Banking','Paid','2024-01-25'),
(4012,7012,3600.00,'Credit Card','Paid','2024-01-25'),
(4013,7013,4650.00,'Debit Card','Paid','2024-01-26'),
(4014,7014,4900.00,'UPI','Paid','2024-01-26'),
(4015,7015,4500.00,'Credit Card','Paid','2024-01-27'),
(4016,7016,5200.00,'Net Banking','Refunded','2024-01-27'),
(4017,7017,5850.00,'Credit Card','Paid','2024-01-28'),
(4018,7018,4700.00,'UPI','Paid','2024-01-28'),
(4019,7019,4500.00,'Debit Card','Paid','2024-01-29'),
(4020,7020,5700.00,'Credit Card','Paid','2024-01-29'),
(4021,7021,5200.00,'UPI','Paid','2024-01-30'),
(4022,7022,2800.00,'Net Banking','Paid','2024-01-30'),
(4023,7023,5100.00,'Credit Card','Paid','2024-01-31'),
(4024,7024,5400.00,'Debit Card','Paid','2024-01-31'),
(4025,7025,4900.00,'UPI','Paid','2024-02-01');
