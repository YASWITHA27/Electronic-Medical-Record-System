-- Procedures for Providers & Medical Records

-- Create a New Medical Record
DELIMITER $$
CREATE PROCEDURE CreateMedicalRecord(
    IN pPatientID INT,
    IN pProviderID INT,
    IN pDateOfVisit DATE,
    IN pSignsAndSymptoms TEXT,
    IN pDischargeDiagnosis TEXT,
    IN pPrescription TEXT
)
BEGIN
    INSERT INTO ClinicalCare_info (PatientID, ProviderID, DateOfVisit, SignsAndSymptoms, DischargeDiagnosis, Prescription)
    VALUES (pPatientID, pProviderID, pDateOfVisit, pSignsAndSymptoms, pDischargeDiagnosis, pPrescription);
END $$
DELIMITER ;

-- Update/ Modify an existing Medical Record
DELIMITER $$
CREATE PROCEDURE UpdateExistingMedicalRecord(
    IN pPatientID INT,
    IN pDateOfVisit DATE,
    IN pSignsAndSymptoms TEXT,
    IN pDischargeDiagnosis TEXT,
    IN pPrescription TEXT
)
BEGIN
    UPDATE ClinicalCare_info
    SET SignsAndSymptoms = pSignsAndSymptoms,
        DischargeDiagnosis = pDischargeDiagnosis,
        Prescription = pPrescription
    WHERE PatientID = pPatientID AND DateOfVisit = pDateOfVisit;
END $$
DELIMITER ;

-- View a Medical Record
DELIMITER $$
CREATE PROCEDURE ViewMedicalRecord(
    IN pPatientID INT,
    IN pDateOfVisit DATE
)
BEGIN
    SELECT * FROM ClinicalCare_info
    WHERE PatientID = pPatientID AND DateOfVisit = pDateOfVisit;
END $$
DELIMITER ;

-- Delete a Medical Record
DELIMITER $$
CREATE PROCEDURE DeleteMedicalRecord(
    IN pPatientID INT,
    IN pDateOfVisit DATE
)
BEGIN
    DELETE FROM ClinicalCare_info
    WHERE PatientID = pPatientID AND DateOfVisit = pDateOfVisit;
END $$
DELIMITER ;

-- Procedures for Receptionist & Appointments

-- Create a new Appointment
DELIMITER $$
CREATE PROCEDURE CreateAppointment (
    IN _PatientID INT,
    IN _ProviderID INT,
    IN _FacilityID INT,
    IN _Date DATE,
    IN _Time TIME,
    IN _ReasonForVisit TEXT
)
BEGIN
    INSERT INTO Appointments (PatientID, ProviderID, FacilityID, Date, Time, ReasonForVisit)
    VALUES (_PatientID, _ProviderID, _FacilityID, _Date, _Time, _ReasonForVisit);
END$$
DELIMITER ;

-- Update an Existing Appointment
DELIMITER $$
CREATE PROCEDURE UpdateAppointment (
    IN _PatientID INT,
    IN _ProviderID INT,
    IN _FacilityID INT,
    IN _Date DATE,
    IN _Time TIME,
    IN _ReasonForVisit TEXT
)
BEGIN
    UPDATE Appointments
    SET ProviderID = _ProviderID, FacilityID = _FacilityID, Time = _Time, ReasonForVisit = _ReasonForVisit
    WHERE PatientID = _PatientID AND Date = _Date;
END$$
DELIMITER ;

-- View an Appointment
DELIMITER $$
CREATE PROCEDURE ViewAppointment (
    IN _PatientID INT,
    IN _Date DATE
)
BEGIN
    SELECT * FROM Appointments
    WHERE PatientID = _PatientID AND Date = _Date;
END$$
DELIMITER ;

-- Delete an Appointment
DELIMITER $$
CREATE PROCEDURE DeleteAppointment (
    IN _PatientID INT,
    IN _Date DATE
)
BEGIN
    DELETE FROM Appointments
    WHERE PatientID = _PatientID AND Date = _Date;
END$$
DELIMITER ;
