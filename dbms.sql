CREATE DATABASE inventory_1;
USE inventory_1;

-- Create tables 

CREATE TABLE Supplier (
    Sup_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Supp_Name VARCHAR(250) NOT NULL,
    Supp_Contact BIGINT NOT NULL,
    Supp_Email VARCHAR(100)
);

CREATE TABLE Material (
    Material_ID VARCHAR(10) PRIMARY KEY,
    Sup_ID INT,
    Material_Name VARCHAR(100) NOT NULL,
    Unit_Cost FLOAT NOT NULL,
    Stock_Qty INT,
    FOREIGN KEY(Sup_ID) REFERENCES Supplier(Sup_ID)
);

CREATE TABLE Customer (
    Cust_ID VARCHAR(10) PRIMARY KEY,
    Order_ID VARCHAR(10), -- Added Order_ID
    Cust_Name VARCHAR(200) NOT NULL,
    Cust_Contact BIGINT NOT NULL,
    Cust_Email VARCHAR(100) NOT NULL
);

CREATE TABLE Model (
    Model_ID VARCHAR(10) PRIMARY KEY,
    Model_Name VARCHAR(100) NOT NULL,
    Production_Cost FLOAT NOT NULL,
    Assembly_Line INT NOT NULL
);
CREATE TABLE Sales (
    Sale_ID VARCHAR(10) PRIMARY KEY,
    Model_ID VARCHAR(10),
    Cust_ID VARCHAR(10),
    Sale_Date DATE NOT NULL,
    Sale_Price FLOAT NOT NULL,
    FOREIGN KEY(Model_ID) REFERENCES Model(Model_ID),
    FOREIGN KEY(Cust_ID) REFERENCES Customer(Cust_ID)
);

CREATE TABLE Inventory (
    Inventory_ID VARCHAR(10) PRIMARY KEY,
    Material_ID VARCHAR(100),
    Quantity INT NOT NULL,
    In_Date DATE NOT NULL,
    FOREIGN KEY(Material_ID) REFERENCES Material(Material_ID)
);

CREATE TABLE Orders (
    Order_ID VARCHAR(10) PRIMARY KEY,
    Model_ID VARCHAR(10),
    Order_Date DATE NOT NULL,
    Due_Date DATE NOT NULL,
    Status VARCHAR(10) NOT NULL,
    FOREIGN KEY(Model_ID) REFERENCES Model(Model_ID)
);


CREATE TABLE Employee (
    Emp_ID VARCHAR(10) PRIMARY KEY,
    Emp_Name VARCHAR(150) NOT NULL,
    Emp_Pos VARCHAR(100) NOT NULL,
    Emp_Dept VARCHAR(100) NOT NULL,
    Emp_Sal FLOAT NOT NULL
);

CREATE TABLE Quality (
    QC_ID VARCHAR(10) PRIMARY KEY,
    Order_ID VARCHAR(10),
    Emp_ID VARCHAR(10),
    Inspection_Date DATE NOT NULL,
    Result VARCHAR(100) NOT NULL,
    FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY(Emp_ID) REFERENCES Employee(Emp_ID)
);

-- Supplier table
INSERT INTO Supplier (Supp_Name, Supp_Contact, Supp_Email) VALUES
('ABC Supplies', 1234567890, 'abc@example.com'),
('XYZ Company', 2345678901, 'xyz@example.com'),
('123 Manufacturing', 3456789012, '123@example.com'),
('Best Parts Co.', 4567890123, 'bestparts@example.com'),
('Global Components Ltd.', 5678901234, 'global@example.com'),
('Quality Suppliers Inc.', 6789012345, 'quality@example.com'),
('Superior Products Co.', 7890123456, 'superior@example.com'),
('Prime Materials Corp.', 8901234567, 'prime@example.com'),
('Dynamic Components LLC', 9012345678, 'dynamic@example.com'),
('Innovative Parts Ltd.', 1234567890, 'innovative@example.com'),
('Reliable Suppliers Co.', 2345678901, 'reliable@example.com'),
('Precision Manufacturing', 3456789012, 'precision@example.com'),
('Tech Components Inc.', 4567890123, 'tech@example.com'),
('Top Quality Parts', 5678901234, 'topquality@example.com'),
('Advanced Materials Corp.', 6789012345, 'advanced@example.com');

-- Material table
INSERT INTO Material VALUES
('MAT001', 1, 'Steel Plates', 50.25, 1000),
('MAT002', 2, 'Aluminum Bars', 30.75, 800),
('MAT003', 3, 'Copper Wire', 15.50, 1200),
('MAT004', 4, 'Plastic Sheets', 10.20, 1500),
('MAT005', 5, 'Rubber Gaskets', 5.75, 2000),
('MAT006', 6, 'Glass Panes', 45.60, 600),
('MAT007', 7, 'Wooden Boards', 20.30, 1000),
('MAT008', 8, 'Brass Fittings', 25.80, 900),
('MAT009', 9, 'Ceramic Tiles', 18.90, 1100),
('MAT010', 10, 'Fiberglass Rolls', 32.40, 700),
('MAT011', 11, 'Stainless Steel Pipes', 65.75, 500),
('MAT012', 12, 'Bronze Sheets', 40.20, 800),
('MAT013', 13, 'Titanium Rods', 85.90, 400),
('MAT014', 14, 'Carbon Fiber Sheets', 75.60, 600),
('MAT015', 15, 'Platinum Wires', 150.25, 300);

-- Customer table
INSERT INTO Customer VALUES
('CUST001', 'ORD001', 'John Doe', 1234567890, 'john.doe@example.com'),
('CUST002', 'ORD002', 'Jane Smith', 2345678901, 'jane.smith@example.com'),
('CUST003', 'ORD003', 'David Johnson', 3456789012, 'david.johnson@example.com'),
('CUST004', 'ORD004', 'Emily Brown', 4567890123, 'emily.brown@example.com'),
('CUST005', 'ORD005', 'Michael Wilson', 5678901234, 'michael.wilson@example.com'),
('CUST006', 'ORD006', 'Jennifer Martinez', 6789012345, 'jennifer.martinez@example.com'),
('CUST007', 'ORD007', 'Christopher Anderson', 7890123456, 'christopher.anderson@example.com'),
('CUST008', 'ORD008', 'Amanda Taylor', 8901234567, 'amanda.taylor@example.com'),
('CUST009', 'ORD009', 'Daniel Thomas', 9012345678, 'daniel.thomas@example.com'),
('CUST010', 'ORD010', 'Jessica Garcia', 1234567890, 'jessica.garcia@example.com'),
('CUST011', 'ORD011', 'Matthew Rodriguez', 2345678901, 'matthew.rodriguez@example.com'),
('CUST012', 'ORD012', 'Ashley Hernandez', 3456789012, 'ashley.hernandez@example.com'),
('CUST013', 'ORD013', 'Joshua Lopez', 4567890123, 'joshua.lopez@example.com'),
('CUST014', 'ORD014', 'Sarah Martinez', 5678901234, 'sarah.martinez@example.com'),
('CUST015', 'ORD015', 'Ryan Young', 6789012345, 'ryan.young@example.com');


-- Sales table
INSERT INTO Sales VALUES
('SALE001', 'MOD001', 'CUST001', '2024-03-01', 500.00),
('SALE002', 'MOD002', 'CUST002', '2024-03-02', 750.00),
('SALE003', 'MOD003', 'CUST003', '2024-03-03', 1200.00),
('SALE004', 'MOD004', 'CUST004', '2024-03-04', 850.00),
('SALE005', 'MOD005', 'CUST005', '2024-03-05', 1500.00),
('SALE006', 'MOD006', 'CUST006', '2024-03-06', 1100.00),
('SALE007', 'MOD007', 'CUST007', '2024-03-07', 950.00),
('SALE008', 'MOD008', 'CUST008', '2024-03-08', 800.00),
('SALE009', 'MOD009', 'CUST009', '2024-03-09', 700.00),
('SALE010', 'MOD010', 'CUST010', '2024-03-10', 950.00),
('SALE011', 'MOD011', 'CUST011', '2024-03-11', 1250.00),
('SALE012', 'MOD012', 'CUST012', '2024-03-12', 1050.00),
('SALE013', 'MOD013', 'CUST013', '2024-03-13', 950.00),
('SALE014', 'MOD014', 'CUST014', '2024-03-14', 1300.00),
('SALE015', 'MOD015', 'CUST015', '2024-03-15', 900.00);

-- Inventory table
INSERT INTO Inventory VALUES
('INV001', 'MAT001', 100, '2024-03-01'),
('INV002', 'MAT002', 150, '2024-03-02'),
('INV003', 'MAT003', 200, '2024-03-03'),
('INV004', 'MAT004', 250, '2024-03-04'),
('INV005', 'MAT005', 300, '2024-03-05'),
('INV006', 'MAT006', 350, '2024-03-06'),
('INV007', 'MAT007', 400, '2024-03-07'),
('INV008', 'MAT008', 450, '2024-03-08'),
('INV009', 'MAT009', 500, '2024-03-09'),
('INV010', 'MAT010', 550, '2024-03-10'),
('INV011', 'MAT011', 600, '2024-03-11'),
('INV012', 'MAT012', 650, '2024-03-12'),
('INV013', 'MAT013', 700, '2024-03-13'),
('INV014', 'MAT014', 750, '2024-03-14'),
('INV015', 'MAT015', 800, '2024-03-15');

-- Orders table
INSERT INTO Orders VALUES
('ORD001', 'MOD001', '2024-03-01', '2024-03-10', 'Pending'),
('ORD002', 'MOD002', '2024-03-02', '2024-03-11', 'Pending'),
('ORD003', 'MOD003', '2024-03-03', '2024-03-12', 'Pending'),
('ORD004', 'MOD004', '2024-03-04', '2024-03-13', 'Pending'),
('ORD005', 'MOD005', '2024-03-05', '2024-03-14', 'Pending'),
('ORD006', 'MOD006', '2024-03-06', '2024-03-15', 'Pending'),
('ORD007', 'MOD007', '2024-03-07', '2024-03-16', 'Pending'),
('ORD008', 'MOD008', '2024-03-08', '2024-03-17', 'Pending'),
('ORD009', 'MOD009', '2024-03-09', '2024-03-18', 'Pending'),
('ORD010', 'MOD010', '2024-03-10', '2024-03-19', 'Pending'),
('ORD011', 'MOD011', '2024-03-11', '2024-03-20', 'Pending'),
('ORD012', 'MOD012', '2024-03-12', '2024-03-21', 'Pending'),
('ORD013', 'MOD013', '2024-03-13', '2024-03-22', 'Pending'),
('ORD014', 'MOD014', '2024-03-14', '2024-03-23', 'Pending'),
('ORD015', 'MOD015', '2024-03-15', '2024-03-24', 'Pending');

-- Model table
INSERT INTO Model VALUES
('MOD001', 'Tesla Model S', 80000.00, 1),
('MOD002', 'Tesla Model 3', 60000.00, 2),
('MOD003', 'Tesla Model X', 90000.00, 3),
('MOD004', 'Tesla Model Y', 70000.00, 1),
('MOD005', 'Tesla Roadster', 200000.00, 2),
('MOD006', 'Tesla Cybertruck', 50000.00, 3),
('MOD007', 'Tesla Semi', 150000.00, 1),
('MOD008', 'Tesla Powerwall', 7000.00, 2),
('MOD009', 'Tesla Solar Roof', 20000.00, 3),
('MOD010', 'Tesla Megapack', 1000000.00, 1),
('MOD011', 'SpaceX Falcon 9', 62000000.00, 2),
('MOD012', 'SpaceX Dragon', 10000000.00, 3),
('MOD013', 'SpaceX Starship', 200000000.00, 1),
('MOD014', 'SpaceX Super Heavy', 50000000.00, 2),
('MOD015', 'SpaceX Crew Dragon', 150000000.00, 3);

-- Employee table
INSERT INTO Employee VALUES
('EMP001', 'John Smith', 'Manager', 'Production', 80000.00),
('EMP002', 'Jane Doe', 'Engineer', 'Production', 60000.00),
('EMP003', 'David Johnson', 'Technician', 'Production', 50000.00),
('EMP004', 'Emily Brown', 'Supervisor', 'Assembly', 70000.00),
('EMP005', 'Michael Wilson', 'Worker', 'Assembly', 40000.00),
('EMP006', 'Jennifer Martinez', 'Quality Control', 'Quality', 55000.00),
('EMP007', 'Christopher Anderson', 'Inspector', 'Quality', 50000.00),
('EMP008', 'Amanda Taylor', 'Analyst', 'Sales', 60000.00),
('EMP009', 'Daniel Thomas', 'Representative', 'Sales', 45000.00),
('EMP010', 'Jessica Garcia', 'Associate', 'Marketing', 55000.00),
('EMP011', 'Matthew Rodriguez', 'Manager', 'Marketing', 80000.00),
('EMP012', 'Ashley Hernandez', 'Coordinator', 'Finance', 60000.00),
('EMP013', 'Joshua Lopez', 'Assistant', 'Finance', 45000.00),
('EMP014', 'Sarah Martinez', 'Accountant', 'Finance', 70000.00),
('EMP015', 'Ryan Young', 'Director', 'HR', 90000.00);

-- Quality table
INSERT INTO Quality VALUES
('QC001', 'ORD001', 'EMP006', '2024-03-05', 'Pass'),
('QC002', 'ORD002', 'EMP006', '2024-03-06', 'Pass'),
('QC003', 'ORD003', 'EMP006', '2024-03-07', 'Fail'),
('QC004', 'ORD004', 'EMP007', '2024-03-08', 'Pass'),
('QC005', 'ORD005', 'EMP007', '2024-03-09', 'Fail'),
('QC006', 'ORD006', 'EMP007', '2024-03-10', 'Pass'),
('QC007', 'ORD007', 'EMP006', '2024-03-11', 'Fail'),
('QC008', 'ORD008', 'EMP007', '2024-03-12', 'Pass'),
('QC009', 'ORD009', 'EMP007', '2024-03-13', 'Pass'),
('QC010', 'ORD010', 'EMP007', '2024-03-14', 'Fail'),
('QC011', 'ORD011', 'EMP007', '2024-03-15', 'Pass'),
('QC012', 'ORD012', 'EMP006', '2024-03-16', 'Fail'),
('QC013', 'ORD013', 'EMP006', '2024-03-17', 'Pass'),
('QC014', 'ORD014', 'EMP006', '2024-03-18', 'Fail'),
('QC015', 'ORD015', 'EMP006', '2024-03-19', 'Pass');
