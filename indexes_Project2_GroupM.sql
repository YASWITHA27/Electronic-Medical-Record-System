-- Index on Patient Names
CREATE INDEX idx_patient_name ON Patients_info(FirstName, LastName);

-- Index on Provider Names and Specialty
CREATE INDEX idx_provider_name_specialty ON Providers_details(FirstName, LastName, Specialty);

-- Index on Appointment Dates and Times
CREATE INDEX idx_appointment_datetime ON Appointments(Date, Time);

-- Index on Medical Records by Patient and Visit Date
CREATE INDEX idx_medical_records_patient_date ON ClinicalCare_info (PatientID, DateOfVisit);

-- Index on Lab Tests by Cost
CREATE INDEX idx_labtests_cost ON LabExams(Cost);

-- Index on Patient Insurance Information
CREATE INDEX idx_patient_insurance ON Patients_info(Insurance);

-- Index on Billing by Payment Status
CREATE INDEX idx_billing_paymentstatus ON Billing(PaymentStatus, DateOfService);

-- Index on Support Staff by Role
CREATE INDEX idx_support_staff_role ON SupportStaff(Role);


-- To use these, one sample query for searching for a patient by name would be
SELECT * FROM Patients_info WHERE FirstName = 'Sarah' AND LastName = 'Smith';

-- To find appointments for a specific day, we use
SELECT * FROM Appointments WHERE Date = '2023-03-01';


