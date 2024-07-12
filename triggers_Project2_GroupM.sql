-- Trigger for New Medical Record Creation
DELIMITER //
CREATE TRIGGER AfterInsertMedicalRecord
AFTER INSERT ON ClinicalCare_info
FOR EACH ROW
BEGIN
INSERT INTO Log (user, table_name, operation_type, new_value)
VALUES (USER(), 'MedicalRecords', 'INSERT', CONCAT_WS(', ', NEW.PatientID, NEW.ProviderID, NEW.DateOfVisit));
END;
//
DELIMITER ;

-- Trigger for Updating a Medical Record
DELIMITER //
CREATE TRIGGER AfterUpdateMedicalRecord
AFTER UPDATE ON ClinicalCare_info
FOR EACH ROW
BEGIN
	INSERT INTO Log (user, table_name, operation_type, old_value, new_value)
    VALUES (
        USER(),
        'MedicalRecords',
        'UPDATE',
        CONCAT_WS(', ', OLD.SignsAndSymptoms, OLD.DischargeDiagnosis, OLD.Prescription),
        CONCAT_WS(', ', NEW.SignsAndSymptoms, NEW.DischargeDiagnosis, NEW.Prescription)
    );
END;
//
DELIMITER ;

-- Trigger for Deleting a Medical Record
DELIMITER //
CREATE TRIGGER AfterDeleteMedicalRecord
AFTER DELETE ON ClinicalCare_info
FOR EACH ROW
BEGIN
    INSERT INTO Log (user, table_name, operation_type, old_value)
    VALUES (USER(), 'MedicalRecords', 'DELETE', CONCAT_WS(', ', OLD.PatientID, OLD.ProviderID, OLD.DateOfVisit));
END;
//
DELIMITER ;

-- Trigger for New Appointment Creation
DELIMITER //
CREATE TRIGGER AfterInsertAppointment
AFTER INSERT ON Appointments
FOR EACH ROW
BEGIN
    INSERT INTO Log (user, table_name, operation_type, new_value)
    VALUES (USER(), 'Appointments', 'INSERT', CONCAT_WS(', ', NEW.PatientID, NEW.ProviderID, NEW.FacilityID, NEW.Date, NEW.Time));
END;
//
DELIMITER ;

-- Trigger for Updating an Appointment
DELIMITER //
CREATE TRIGGER AfterUpdateAppointment
AFTER UPDATE ON Appointments
FOR EACH ROW
BEGIN
    INSERT INTO Log (user, table_name, operation_type, old_value, new_value)
    VALUES (
        USER(),
        'Appointments',
        'UPDATE',
        CONCAT_WS(', ', OLD.ProviderID, OLD.FacilityID, OLD.Time, OLD.ReasonForVisit),
        CONCAT_WS(', ', NEW.ProviderID, NEW.FacilityID, NEW.Time, NEW.ReasonForVisit)
    );
END;
//
DELIMITER ;

-- Trigger for Deleting an Appointment
DELIMITER //
CREATE TRIGGER AfterDeleteAppointment
AFTER DELETE ON Appointments
FOR EACH ROW
BEGIN
    INSERT INTO Log (user, table_name, operation_type, old_value)
    VALUES (USER(), 'Appointments', 'DELETE', CONCAT_WS(', ', OLD.PatientID, OLD.ProviderID, OLD.FacilityID, OLD.Date, OLD.Time));
END;
//
DELIMITER ;

select * from log;