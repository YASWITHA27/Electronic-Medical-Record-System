-- View for Complete Patient Information
CREATE VIEW CompletePatientInformation AS
SELECT p.PatientID, p.FirstName, p.LastName, p.DOB, p.Insurance, 
       a.Street, a.City, a.State, a.Zipcode, a.Country
FROM Patients_info p
JOIN Address a ON p.AddressID = a.AddressID;

-- View for Provider Directory
CREATE VIEW ProviderDirectory AS
SELECT pr.ProviderID, pr.FirstName, pr.LastName, pr.Specialty, 
       a.Street, a.City, a.State, a.Zipcode, a.Country
FROM Providers_details pr
JOIN Address a ON pr.AddressID = a.AddressID;

-- View for Upcoming Appointments
CREATE VIEW UpcomingAppointments AS
SELECT ap.AppointmentID, pa.FirstName AS PatientFirstName, pa.LastName AS PatientLastName, 
       pr.FirstName AS ProviderFirstName, pr.LastName AS ProviderLastName, 
       ap.Date, ap.Time, f.FacilityType, f.AvailabilityStatus
FROM Appointments ap
JOIN Patients_info pa ON ap.PatientID = pa.PatientID
JOIN Providers_details pr ON ap.ProviderID = pr.ProviderID
JOIN Facilities f ON ap.FacilityID = f.FacilityID
WHERE ap.Date >= CURDATE();

-- View for Patient Visits
CREATE VIEW PatientVisits AS
SELECT mr.PatientID, p.FirstName, p.LastName, mr.DateOfVisit, mr.SignsAndSymptoms, 
       mr.DischargeDiagnosis, mr.Prescription, pr.FirstName AS ProviderFirstName, 
       pr.LastName AS ProviderLastName
FROM ClinicalCare_info mr
JOIN Patients_info p ON mr.PatientID = p.PatientID
JOIN Providers_details pr ON mr.ProviderID = pr.ProviderID;

-- View for Billing and Insurance Claims
CREATE VIEW BillingInsuranceClaims AS
SELECT b.BillID, p.FirstName, p.LastName, b.DateOfService, b.Amount, b.InsuranceClaimed, b.PaymentStatus
FROM Billing b
JOIN Patients_info p ON b.PatientID = p.PatientID
WHERE b.PaymentStatus = 'Pending' OR b.PaymentStatus = 'Partial';

-- View for Medication Inventory
CREATE VIEW MedicationInventory AS
SELECT SupplyID, Name, Quantity, ExpiryDate
FROM Supplies
WHERE Quantity > 0
ORDER BY ExpiryDate ASC;

-- View for Lab Test Requests and Results
CREATE VIEW LabTestStatus AS
SELECT pl.ExamTestProcedureID, pa.FirstName, pa.LastName, lt.Name AS TestName, 
       pl.DateRequested, pl.Result, pl.DateResults
FROM ExamsTestsProcedures pl
JOIN Patients_info pa ON pl.PatientID = pa.PatientID
JOIN LabExams lt ON pl.TestID = lt.TestsID;


-- To use these views, for instance to retrive Complete Patient Information for a Check-In Process
SELECT * FROM CompletePatientInformation WHERE FirstName = 'Sarah' AND LastName = 'Smith';

-- To find Upcoming Appointments
SELECT * FROM UpcomingAppointments WHERE Date = '2023-03-01';
