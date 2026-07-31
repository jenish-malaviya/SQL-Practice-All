CREATE TABLE Courses
(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Category VARCHAR(50),
    InstructorName VARCHAR(100),
    DurationHours INT,
    Level VARCHAR(20),
    Price DECIMAL(10,2),
    DiscountPercent INT,
    Rating DECIMAL(2,1),
    TotalStudents INT,
    Language VARCHAR(30),
    CertificateAvailable VARCHAR(5),
    LaunchDate DATE,
    LastUpdated DATE,
    CourseStatus VARCHAR(20),
    Platform VARCHAR(50),
    Country VARCHAR(50),
    Revenue DECIMAL(12,2),
    CompletionRate DECIMAL(5,2),
    Reviews INT
);

INSERT INTO Courses
VALUES
(101,'Python for Beginners','Programming','Amit Sharma',40,'Beginner',2999,20,4.8,12500,'English','Yes','2023-01-15','2026-06-01','Active','SkillHub','India',2995000,82.50,3200),

(102,'Advanced SQL','Database','Priya Patel',35,'Advanced',3499,15,4.7,9800,'English','Yes','2022-11-10','2026-05-20','Active','SkillHub','India',2450000,79.30,2850),

(103,'Excel Masterclass','Office','Rahul Mehta',25,'Beginner',1999,30,4.5,18500,'English','Yes','2021-07-12','2026-04-10','Active','LearnNow','India',3100000,88.10,4500),

(104,'Power BI Dashboard','Analytics','Sneha Joshi',32,'Intermediate',3999,25,4.9,9200,'English','Yes','2023-02-20','2026-07-01','Active','SkillHub','India',3680000,91.20,5100),

(105,'Data Science Bootcamp','Data Science','Karan Shah',80,'Advanced',7999,10,4.8,6100,'English','Yes','2022-08-15','2026-06-18','Active','EduPlus','India',4880000,74.80,3900),

(106,'Digital Marketing','Marketing','Neha Verma',30,'Intermediate',2499,35,4.4,14200,'English','No','2021-10-10','2026-05-05','Active','LearnNow','India',2750000,83.90,2500),

(107,'Java Programming','Programming','Rohan Desai',50,'Intermediate',3799,20,4.6,8700,'English','Yes','2022-04-18','2026-03-25','Active','EduPlus','India',3300000,78.60,2900),

(108,'UI UX Design','Design','Meera Nair',28,'Beginner',2899,25,4.3,7300,'English','Yes','2023-03-10','2026-06-28','Inactive','DesignPro','India',1800000,69.40,1400),

(109,'Machine Learning','AI','Vikas Kumar',70,'Advanced',6999,15,4.9,5400,'English','Yes','2022-01-08','2026-07-15','Active','SkillHub','India',5200000,72.10,4700),

(110,'Graphic Design','Design','Anjali Singh',22,'Beginner',1899,40,4.2,11600,'Hindi','No','2021-09-09','2026-02-14','Active','DesignPro','India',1950000,86.50,2100),

(111,'AWS Cloud Basics','Cloud','Arjun Rao',38,'Intermediate',4499,20,4.8,6900,'English','Yes','2023-05-01','2026-07-10','Active','CloudTech','India',3100000,80.30,2750),

(112,'Cyber Security','Security','Pooja Gupta',45,'Advanced',5999,15,4.7,5800,'English','Yes','2022-12-05','2026-06-12','Active','SecureLearn','India',3450000,76.40,2400),

(113,'C Programming','Programming','Mohit Agarwal',26,'Beginner',1599,30,4.1,9800,'English','No','2021-05-20','2026-01-18','Inactive','LearnNow','India',1560000,84.90,1700),

(114,'Tableau Analytics','Analytics','Sanjay Yadav',34,'Intermediate',4299,20,4.8,7600,'English','Yes','2022-06-11','2026-05-30','Active','SkillHub','India',3250000,81.70,3100),

(115,'Statistics for Data Science','Mathematics','Kavita Sharma',42,'Intermediate',3299,25,4.6,8900,'English','Yes','2023-01-25','2026-07-20','Active','EduPlus','India',2950000,85.20,2600);

SELECT * FROM Courses;