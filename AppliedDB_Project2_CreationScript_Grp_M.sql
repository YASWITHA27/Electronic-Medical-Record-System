# Applied DB Project 2
# Group M
# Members: Yaswitha, Niveditha, Geetha, Bhanu
CREATE DATABASE OutpatientClinic;
USE OutpatientClinic;
DROP DATABASE OutpatientClinic;

-- Address Table
CREATE TABLE Address (
  AddressID INT AUTO_INCREMENT PRIMARY KEY,
  Street VARCHAR(255),
  City VARCHAR(50),
  State VARCHAR(50),
  Zipcode VARCHAR(10),
  Country VARCHAR(50)
);

-- Patients_info Table
CREATE TABLE Patients_info (
  PatientID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  DOB DATE,
  AddressID INT,
  Insurance VARCHAR(100),
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

-- Providers_details Table
CREATE TABLE Providers_details (
  ProviderID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Specialty VARCHAR(100),
  AddressID INT,
  Qualification TEXT,
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

-- Facilities Table
CREATE TABLE Facilities (
    FacilityID INT AUTO_INCREMENT PRIMARY KEY,
    FacilityType VARCHAR(50) NOT NULL,
    AddressID INT,
    AvailabilityStatus VARCHAR(50) CHECK (AvailabilityStatus IN ('Available', 'Occupied')),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

-- Visit_info Table
CREATE TABLE Visit_info (
  VisitID INT AUTO_INCREMENT PRIMARY KEY,
  PatientID INT NOT NULL,
  ProviderID INT NOT NULL,
  FacilityID INT NOT NULL,
  Date DATE NOT NULL,
  Time TIME NOT NULL,
  ReasonForVisit TEXT,
  FOREIGN KEY (PatientID) REFERENCES Patients_info(PatientID),
  FOREIGN KEY (ProviderID) REFERENCES Providers_details(ProviderID),
  FOREIGN KEY (FacilityID) REFERENCES Facilities(FacilityID)
);

-- ClinicalCare_info Table
CREATE TABLE ClinicalCare_info (
  CareID INT AUTO_INCREMENT PRIMARY KEY,
  PatientID INT NOT NULL,
  ProviderID INT NOT NULL,
  VisitID INT NOT NULL,
  DateOfVisit DATE NOT NULL,
  SignsAndSymptoms TEXT,
  DischargeDiagnosis TEXT,
  Prescription TEXT,
  OrdersResultsOfExams TEXT,
  Tests TEXT,
  Procedures TEXT,
  FOREIGN KEY (PatientID) REFERENCES Patients_info(PatientID),
  FOREIGN KEY (ProviderID) REFERENCES Providers_details(ProviderID),
  FOREIGN KEY (VisitID) REFERENCES Visit_info(VisitID)
);

-- Appointments Table
CREATE TABLE Appointments (
  AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
  PatientID INT NOT NULL,
  ProviderID INT NOT NULL,
  FacilityID INT NOT NULL,
  Date DATE NOT NULL,
  Time TIME NOT NULL,
  ReasonForVisit TEXT,
  FOREIGN KEY (PatientID) REFERENCES Patients_info(PatientID),
  FOREIGN KEY (ProviderID) REFERENCES Providers_details(ProviderID),
  FOREIGN KEY (FacilityID) REFERENCES Facilities(FacilityID)
);

-- LabExams Table
CREATE TABLE LabExams (
    TestsID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Cost DECIMAL(10,2) NOT NULL
);

-- ExamsTestsProcedures Table
CREATE TABLE ExamsTestsProcedures (
  ExamTestProcedureID INT AUTO_INCREMENT PRIMARY KEY,
  PatientID INT NOT NULL,
  ProviderID INT NOT NULL,
  TestID INT NOT NULL,
  VisitID INT NOT NULL,
  Type VARCHAR(100) NOT NULL,
  DateRequested DATE NOT NULL,
  Result TEXT,
  DateResults DATE,
  FOREIGN KEY (PatientID) REFERENCES Patients_info(PatientID),
  FOREIGN KEY (ProviderID) REFERENCES Providers_details(ProviderID),
  FOREIGN KEY (TestID) REFERENCES LabExams(TestsID),
  FOREIGN KEY (VisitID) REFERENCES Visit_info(VisitID)
);

-- Supplies Table
CREATE TABLE Supplies (
  SupplyID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Quantity INT NOT NULL CHECK (Quantity >=0),
  ExpiryDate DATE NOT NULL
);

-- Billing Table
CREATE TABLE Billing (
  BillID INT AUTO_INCREMENT PRIMARY KEY,
  PatientID INT NOT NULL,
  DateOfService DATE NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  InsuranceClaimed TEXT,
  PaymentStatus VARCHAR(50),
  FOREIGN KEY (PatientID) REFERENCES Patients_info(PatientID)
);

-- SupportStaff Table (Nurses, Lab Technicians and Receptionists, can be extended with other roles)

CREATE TABLE SupportStaff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Role VARCHAR(50) CHECK (Role IN ('Nurse', 'Receptionist')),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    AddressID INT,
    Qualification TEXT,
    WorkingHours VARCHAR(50), -- Specific for Receptionists
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

-- Emergency_dept Table
CREATE TABLE Emergency_dept (
  Emergency_deptID INT AUTO_INCREMENT PRIMARY KEY,
  DeptName VARCHAR(50) NOT NULL,
  AddressID INT,
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

-- Beds Table
CREATE TABLE Beds (
  Bed_id INT AUTO_INCREMENT  PRIMARY KEY,
  Room_no INT
);

/*-- Log Table
CREATE TABLE RecordLog (
    logId INT PRIMARY KEY AUTO_INCREMENT,
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_details VARCHAR(50) NOT NULL,
    tableName VARCHAR(30) NOT NULL,
    operationType VARCHAR(30) NOT NULL,
    oldValue TEXT,  -- Changed to TEXT for potentially large data
    newValue TEXT
);*/

-- Log Table
CREATE TABLE Log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user VARCHAR(50) NOT NULL,
    table_name VARCHAR(30) NOT NULL,
    operation_type VARCHAR(30) NOT NULL,
    old_value TEXT,  -- Changed to TEXT for potentially large data
    new_value TEXT
);
