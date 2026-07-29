CREATE TABLE Patients
(
    PatientID SERIAL PRIMARY KEY,
    PatientName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50),
    AdmissionDate DATE,
    DischargeDate DATE,
    InsuranceProvider VARCHAR(100)
);
INSERT INTO Patients
(PatientName, Gender, Age, City, AdmissionDate, DischargeDate, InsuranceProvider)
VALUES
('Amit','Male',35,'Pune','2024-01-10','2024-01-15','Star'),
('Priya','Female',29,'Mumbai','2024-01-12',NULL,NULL),
('Rahul','Male',42,'Delhi','2024-01-15','2024-01-20','ICICI'),
('Sneha','Female',31,'Pune','2024-01-18',NULL,'HDFC'),
('Karan','Male',26,'Ahmedabad','2024-02-01','2024-02-06',NULL),
('Neha','Female',38,'Mumbai','2024-02-05','2024-02-11','Star'),
('Rohan','Male',45,'Delhi','2024-02-08',NULL,'ICICI'),
('Pooja','Female',27,'Surat','2024-02-10','2024-02-15',NULL);

SELECT * FROM Patients;

CREATE TABLE Doctors
(
    DoctorID SERIAL PRIMARY KEY,
    DoctorName VARCHAR(100),
    Department VARCHAR(100),
    Salary NUMERIC(10,2),
    Experience INT
);
INSERT INTO Doctors
(DoctorName, Department, Salary, Experience)
VALUES
('Dr Sharma','Cardiology',150000,12),
('Dr Patel','Neurology',180000,15),
('Dr Khan','Orthopedic',140000,10),
('Dr Mehta','General',90000,6),
('Dr Singh','Cardiology',160000,11),
('Dr Rao','General',85000,5);

SELECT * FROM Doctors;

CREATE TABLE Appointments
(
    AppointmentID SERIAL PRIMARY KEY,
    PatientID INT REFERENCES Patients(PatientID),
    DoctorID INT REFERENCES Doctors(DoctorID),
    AppointmentDate DATE,
    Status VARCHAR(20)
);
INSERT INTO Appointments
(PatientID, DoctorID, AppointmentDate, Status)
VALUES
(1,1,'2024-01-10','Completed'),
(2,4,'2024-01-12','Pending'),
(3,2,'2024-01-15','Completed'),
(4,5,'2024-01-18','Completed'),
(5,3,'2024-02-01','Cancelled'),
(6,1,'2024-02-05','Completed'),
(7,2,'2024-02-08','Pending'),
(8,6,'2024-02-10','Completed');

SELECT * FROM Appointments;

CREATE TABLE Bills
(
    BillID SERIAL PRIMARY KEY,
    PatientID INT REFERENCES Patients(PatientID),
    TotalAmount NUMERIC(10,2),
    PaymentStatus VARCHAR(20)
);
INSERT INTO Bills
(PatientID, TotalAmount, PaymentStatus)
VALUES
(1,8000,'Paid'),
(2,5000,'Pending'),
(3,15000,'Paid'),
(4,10000,'Pending'),
(5,12000,'Paid'),
(6,7000,'Paid'),
(7,18000,'Pending'),
(8,6500,'Paid');

SELECT * FROM Bills;