USE OutpatientClinic;

INSERT INTO Address (Street, City, State, Zipcode, Country)
VALUES
('123 Pine St', 'Chicago', 'IL', '60601', 'USA'),
('456 Oak Rd', 'Los Angeles', 'CA', '90001', 'USA'),
('789 Elm Ln', 'Houston', 'TX', '77001', 'USA'),
('101 Maple Ave', 'Miami', 'FL', '33101', 'USA'),
('112 Birch Blvd', 'New York', 'NY', '10001', 'USA'),
('131 Cedar Dr', 'Phoenix', 'AZ', '85001', 'USA'),
('154 Willow Way', 'Dallas', 'TX', '75201', 'USA'),
('178 Maple St', 'Atlanta', 'GA', '30301', 'USA'),
('201 Pine Rd', 'San Antonio', 'TX', '78201', 'USA'),
('223 Elm Pl', 'Los Angeles', 'CA', '90002', 'USA'),
('242 Cedar Pkwy', 'San Francisco', 'CA', '94101', 'USA'),
('267 Oak Cres', 'Seattle', 'WA', '98101', 'USA'),
('281 Birch Ln', 'Boston', 'MA', '02108', 'USA'),
('306 Willow Rd', 'Denver', 'CO', '80201', 'USA'),
('327 Maple St', 'Philadelphia', 'PA', '19101', 'USA');


INSERT INTO Patients_info (FirstName, LastName, DOB, AddressID, Insurance) VALUES
('John', 'Doe', '1987-09-20', 1, 'BlueCross'),
('Sarah', 'Smith', '1992-07-10', 2, 'MediCare'),
('Robert', 'Johnson', '1975-12-30', 3, 'HealthPlus'),
('Jessica', 'Williams', '1989-04-05', 4, 'WellnessCare'),
('David', 'Brown', '1996-10-15', 5, 'MediAid'),
('Emily', 'Anderson', '1990-03-25', 6, 'BlueShield'),
('Michael', 'Wilson', '1985-08-12', 7, 'MediFirst'),
('Olivia', 'Martinez', '1998-05-18', 8, 'HealthCare'),
('William', 'Garcia', '1994-12-07', 9, 'BlueCross'),
('Sophia', 'Taylor', '2000-09-03', 10, 'MediCare'),
('Daniel', 'Clark', '1983-06-29', 11, 'WellnessPlus'),
('Isabella', 'Lewis', '1993-11-14', 12, 'HealthFirst'),
('Ethan', 'Thomas', '1988-04-22', 13, 'BlueAid'),
('Ava', 'Harris', '2002-01-08', 14, 'MediShield'),
('Matthew', 'Walker', '1997-07-19', 15, 'HealthCare');

INSERT INTO Providers_details (FirstName, LastName, Specialty, AddressID, Qualification)
VALUES
('David', 'Miller', 'Cardiology', 4, 'MD in Cardiology'),
('Rachel', 'Thompson', 'Dermatology', 5, 'MD in Dermatology'),
('Eric', 'Anderson', 'Orthopedics', 6, 'MD in Orthopedics'),
('Michelle', 'Garcia', 'Neurology', 7, 'MD in Neurology'),
('Patrick', 'Lee', 'Dermatology', 8, 'MD in Dermatology'),
('Catherine', 'Clark', 'General Medicine', 9, 'MD'),
('Daniel', 'Harris', 'Cardiology', 10, 'MD in Cardiology'),
('Rebecca', 'Jones', 'General Medicine', 1, 'MD'),
('Samuel', 'Wilson', 'Orthopedics', 2, 'MD in Orthopedics'),
('Natalie', 'Parker', 'Neurology', 3, 'MD in Neurology'),
('Matthew', 'Scott', 'Orthopedics', 11, 'MD in Orthopedics'),
('Jennifer', 'Young', 'Pediatrics', 12, 'MD in Pediatrics'),
('Alexander', 'Brown', 'Cardiology', 13, 'MD in Cardiology'),
('Emily', 'Moore', 'General Medicine', 14, 'MD'),
('Michael', 'Roberts', 'Pediatrics', 15, 'MD in Pediatrics');


INSERT INTO Facilities (FacilityType, AddressID, AvailabilityStatus) VALUES
('Intensive Care Unit', 1, 'Occupied'),
('Consultation Room', 2, 'Available'),
('Operating Room', 3, 'Occupied'),
('Rehabilitation Center', 4, 'Available'),
('Diagnostic Center', 5, 'Occupied'),
('Radiology Department', 6, 'Available'),
('Pediatric Ward', 7, 'Available'),
('Laboratory', 8, 'Available'),
('Surgical Theater', 9, 'Occupied'),
('Physical Therapy Room', 10, 'Available'),
('MRI Imaging Center', 11, 'Occupied'),
('X-Ray Facility', 12, 'Available'),
('Emergency Room', 13, 'Available'),
('Ultrasound Room', 14, 'Occupied'),
('Emergency Surgery Unit', 15, 'Occupied');

-- First, insert data into the Visit_info table
INSERT INTO Visit_info (PatientID, ProviderID, FacilityID, Date, Time, ReasonForVisit) VALUES
(1, 11, 1, '2023-03-01', '10:00:00', 'Chest discomfort'),
(2, 1, 3, '2023-04-05', '11:30:00', 'Back pain'),
(3, 2, 5, '2023-02-20', '13:00:00', 'Joint pain'),
(4, 3, 7, '2023-01-15', '14:30:00', 'Migraine'),
(5, 4, 9, '2023-05-10', '15:30:00', 'Allergic reaction'),
(6, 5, 11, '2023-06-05', '16:00:00', 'Digestive issues'),
(7, 6, 13, '2023-07-20', '17:30:00', 'Respiratory problems'),
(8, 7, 2, '2023-08-12', '18:00:00', 'Skin condition'),
(9, 8, 4, '2023-09-03', '19:30:00', 'Eye infection'),
(10, 9, 6, '2023-10-25', '20:00:00', 'Dental checkup'),
(11, 10, 8, '2023-11-15', '21:30:00', 'Anxiety disorder'),
(12, 12, 10, '2023-12-30', '22:00:00', 'Sleep disorder'),
(13, 13, 12, '2024-01-10', '09:30:00', 'Chronic pain'),
(14, 14, 14, '2024-02-18', '10:15:00', 'High blood pressure'),
(15, 15, 15, '2024-03-05', '11:45:00', 'Urinary tract infection');


INSERT INTO ClinicalCare_info (PatientID, ProviderID, VisitID, DateOfVisit, SignsAndSymptoms, DischargeDiagnosis, Prescription, OrdersResultsOfExams, Tests, Procedures) VALUES
(1, 1, 1, '2023-03-01', 'Chest pain', 'Angina', 'Aspirin', 'ECG showed irregularities', 'Cardiac stress test', 'Angioplasty'),
(2, 3, 2, '2023-04-05', 'Knee pain', 'Arthritis', 'Ibuprofen', 'X-ray showed inflammation', 'Joint fluid analysis', 'Physical therapy'),
(3, 2, 3, '2023-02-20', 'Skin rash', 'Eczema', 'Steroid cream', 'Skin biopsy needed', 'Allergy tests', 'Dermatological procedures'),
(4, 7, 4, '2023-03-15', 'Fever and cough', 'Flu', 'Paracetamol', 'Positive for influenza', 'Rapid flu test', 'Symptomatic treatment'),
(5, 5, 5, '2023-05-10', 'Joint pain', 'Arthritis', 'Ibuprofen', 'MRI showed inflammation', 'Arthritis panel', 'Joint injections'),
(6, 4, 6, '2023-01-05', 'Headache', 'Migraine', 'Sumatriptan', 'CT scan clear', 'Neurological exam', 'Medication adjustment'),
(7, 11, 7, '2023-05-15', 'Back pain', 'Sciatica', 'Ibuprofen', 'MRI showed disc compression', 'Nerve conduction study', 'Physical therapy'),
(8, 9, 8, '2023-06-06', 'Elbow pain', 'Tennis Elbow', 'Ice pack', 'X-ray clear', 'Physical exam', 'Rest and ice'),
(9, 1, 9, '2023-02-14', 'Palpitations', 'Arrhythmia', 'Beta-blockers', 'EKG showed irregular heartbeat', 'Cardiac monitoring', 'Heart catheterization'),
(10, 8, 10, '2023-03-28', 'Fatigue', 'Vitamin D deficiency', 'Vitamin D supplements', 'Blood test showed low levels', 'Nutritional assessment', 'Supplement regimen'),
(11, 6, 11, '2023-04-22', 'Frequent colds', 'Low immunity', 'Vitamin C supplements', 'CBC showed low WBC count', 'Immune function tests', 'Immunotherapy'),
(12, 5, 12, '2023-06-09', 'Ankle pain', 'Sprain', 'Ice pack', 'X-ray showed mild sprain', 'Physical examination', 'RICE therapy'),
(13, 10, 13, '2023-07-02', 'Stomach pain', 'Gastritis', 'Antacids', 'Endoscopy needed', 'Helicobacter pylori test', 'Medication and diet plan'),
(14, 3, 14, '2023-01-19', 'Shoulder pain', 'Frozen shoulder', 'Painkillers', 'MRI recommended', 'Shoulder range of motion test', 'Physical therapy'),
(15, 12, 15, '2023-03-10', 'Child fever', 'Viral Fever', 'Paracetamol', 'Viral panel positive', 'Complete blood count', 'Symptomatic treatment');

INSERT INTO Appointments (PatientID, ProviderID, FacilityID, Date, Time, ReasonForVisit) VALUES
(1, 1, 1, '2023-03-01', '10:00:00', 'Chest discomfort'),
(2, 3, 2, '2023-04-05', '11:30:00', 'Knee pain'),
(3, 5, 3, '2023-05-10', '13:00:00', 'Joint pain'),
(4, 7, 4, '2023-06-15', '14:30:00', 'Headache'),
(5, 9, 5, '2023-07-20', '09:00:00', 'Elbow pain'),
(6, 11, 6, '2023-08-25', '11:00:00', 'Back pain'),
(7, 13, 7, '2023-09-30', '15:30:00', 'Fatigue'),
(8, 15, 8, '2023-10-10', '16:45:00', 'Ankle pain'),
(9, 2, 9, '2023-11-05', '10:15:00', 'Shoulder pain'),
(10, 4, 10, '2023-12-20', '12:00:00', 'Child fever'),
(11, 6, 11, '2024-01-10', '09:30:00', 'Allergy symptoms'),
(12, 8, 12, '2024-02-15', '14:00:00', 'Digestive issues'),
(13, 10, 13, '2024-03-20', '16:00:00', 'Respiratory infection'),
(14, 12, 14, '2024-04-25', '11:45:00', 'Vision problems'),
(15, 14, 15, '2024-05-30', '13:45:00', 'Dental checkup');

INSERT INTO LabExams (Name, Description, Cost) VALUES
('Complete Blood Count', 'Measures different components of blood', 50.00),
('Lipid Panel', 'Measures cholesterol levels in blood', 60.00),
('Blood Glucose Test', 'Measures the sugar level in blood', 20.00),
('Thyroid Function Test', 'Measures how well the thyroid gland is working', 70.00),
('Hemoglobin A1C', 'Average blood sugar over 2-3 months', 45.00),
('MRI Scan', 'Magnetic imaging of body structures', 700.00),
('CT Scan', 'Detailed X-ray images of internal organs', 500.00),
('Urinalysis', 'Examination of urine for various conditions', 30.00),
('Liver Function Test', 'Monitors liver conditions', 55.00),
('Kidney Function Test', 'Assesses how well kidneys are working', 60.00),
('Electrolyte Test', 'Measures sodium, potassium, chloride levels', 35.00),
('Bone Density Test', 'Measures the density of bones', 100.00),
('Allergy Testing', 'Determines allergic reactions', 80.00),
('Tuberculosis Test', 'Checks for tuberculosis infection', 20.00),
('ECG', 'Measures electrical activity of the heart', 110.00);


INSERT INTO ExamsTestsProcedures (PatientID, ProviderID, TestID, VisitID, Type, DateRequested, Result, DateResults) VALUES
(1, 1, 1, 1, 'Blood Test', '2023-03-02', 'Normal', '2023-03-05'),
(1, 3, 2, 2, 'Blood Test', '2023-04-06', 'Elevated Uric Acid', '2023-04-08'),
(2, 2, 2, 3, 'Blood Test', '2023-02-21', 'Normal', '2023-02-23'),
(2, 7, 3, 4, 'Blood Test', '2023-03-16', 'Low RBC count', '2023-03-20'),
(3, 5, 1, 5, 'Blood Test', '2023-05-11', 'Normal', '2023-05-14'),
(4, 4, 4, 6, 'Blood Test', '2023-01-06', 'Normal', '2023-01-09'),
(5, 9, 3, 7, 'Blood Test', '2023-06-07', 'Normal', '2023-06-10'),
(6, 1, 4, 8, 'Blood Test', '2023-02-15', 'Elevated Cholesterol', '2023-02-19'),
(7, 8, 2, 9, 'Blood Test', '2023-03-29', 'Normal', '2023-04-01'),
(8, 10, 3, 10, 'Blood Test', '2023-06-10', 'Elevated WBC count', '2023-06-14'),
(9, 3, 1, 11, 'Blood Test', '2023-01-20', 'Normal', '2023-01-22'),
(10, 12, 4, 12, 'Blood Test', '2023-03-11', 'Normal', '2023-03-14'),
(11, 2, 2, 13, 'Blood Test', '2023-04-25', 'Elevated Creatinine', '2023-04-28'),
(12, 4, 4, 14, 'Blood Test', '2023-06-11', 'Elevated Cholesterol', '2023-06-15'),
(13, 3, 3, 15, 'Blood Test', '2023-06-12', 'Low Platelet count', '2023-06-16');

INSERT INTO Supplies (Name, Quantity, ExpiryDate) VALUES
('Bandages', 950, '2025-01-05'),
('Antiseptic cream', 430, '2025-01-25'),
('Insulin', 280, '2024-09-10'),
('Blood pressure meds', 390, '2024-07-28'),
('Antibiotics', 480, '2024-06-25'),
('Cough syrup', 330, '2024-12-28'),
('Antihistamine', 490, '2024-06-28'),
('Cold compress', 140, '2025-05-05'),
('Pain relief spray', 95, '2024-12-25'),
('Digital thermometers', 115, '2025-10-28'),
('Calamine lotion', 190, '2024-08-10'),
('Vaporub', 490, '2024-12-10'),
('Digestive meds', 580, '2024-09-10'),
('Eye drops', 240, '2024-10-05'),
('Nasal spray', 190, '2024-11-25');

INSERT INTO Billing (PatientID, DateOfService, Amount, InsuranceClaimed, PaymentStatus) VALUES
(1, '2023-03-01', 210.00, 'Claimed', 'Paid'),
(2, '2023-02-20', 155.00, 'Claimed', 'Pending'),
(3, '2023-05-10', 185.00, 'Not Claimed', 'Paid'),
(4, '2023-01-05', 205.00, 'Claimed', 'Paid'),
(5, '2023-06-06', 170.00, 'Not Claimed', 'Partial'),
(6, '2023-02-14', 198.00, 'Claimed', 'Paid'),
(7, '2023-03-28', 178.00, 'Claimed', 'Paid'),
(8, '2023-06-09', 192.00, 'Not Claimed', 'Paid'),
(9, '2023-01-19', 225.00, 'Claimed', 'Pending'),
(10, '2023-03-10', 162.00, 'Claimed', 'Paid'),
(11, '2023-04-22', 208.00, 'Not Claimed', 'Paid'),
(12, '2023-06-11', 178.00, 'Claimed', 'Pending'),
(13, '2023-06-12', 175.00, 'Claimed', 'Paid'),
(14, '2023-05-25', 212.00, 'Not Claimed', 'Paid'),
(15, '2023-07-01', 198.00, 'Claimed', 'Partial');

INSERT INTO SupportStaff (Role, FirstName, LastName, AddressID, Qualification, WorkingHours) VALUES
('Nurse', 'Alex', 'Morris', 1, 'BSN', NULL),
('Nurse', 'Blake', 'Anderson', 2, 'BSN', NULL),
('Receptionist', 'Carla', 'Davis', 3, 'B.A.', '9am-5pm'),
('Receptionist', 'Derek', 'Evans', 4, 'B.Com', '9am-5pm'),
('Nurse', 'Ella', 'Garcia', 5, 'BSN', NULL),
('Nurse', 'Finn', 'Martinez', 6, 'BSN', NULL),
('Receptionist', 'Gabriella', 'Moore', 7, 'B.A.', '10am-6pm'),
('Receptionist', 'Henry', 'Thompson', 8, 'B.A.', '10am-6pm'),
('Nurse', 'Isaac', 'Perez', 9, 'BSN', NULL),
('Nurse', 'Jasmine', 'Lopez', 10, 'BSN', NULL),
('Receptionist', 'Kate', 'Phillips', 11, 'B.A.', '9am-5pm'),
('Receptionist', 'Liam', 'Robinson', 12, 'B.Com', '9am-5pm'),
('Nurse', 'Morgan', 'King', 13, 'BSN', NULL),
('Nurse', 'Natalie', 'Green', 14, 'BSN', NULL),
('Receptionist', 'Oscar', 'Baker', 15, 'B.Com', '10am-6pm');


INSERT INTO Emergency_dept (DeptName, AddressID) VALUES
('Emergency Department - Cardiology Wing', 1),
('Pediatric Emergency Unit', 5),
('Trauma Center Emergency Department', 7),
('Orthopedic Emergency Department', 9),
('Neurology Emergency Unit', 3),
('Maternity Emergency Services', 4),
('Surgical Emergency Department', 2),
('Emergency Psychiatry Services', 1),
('Oncology Emergency Unit', 6),
('ENT Emergency Department', 3),
('Emergency Eye Care Center', 2),
('Dental Emergency Unit', 1),
('Gastroenterology Emergency Services', 7),
('Endocrinology Emergency Department', 8),
('Allergy and Immunology Emergency Unit', 5);

INSERT INTO Beds (Room_no) VALUES
(101),
(102),
(102),
(103),
(103),
(104),
(104),
(105),
(105),
(106),
(106),
(107),
(107),
(108),
(108);




