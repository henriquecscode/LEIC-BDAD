.mode	columns
.headers	on
.nullvalue	NULL
PRAGMA foreign_keys = ON;

CREATE VIEW IF NOT EXISTS AllAssignedWorkers AS
SELECT person from Manager
UNION
SELECT person from Maintenance
UNION
SELECT person from Volunteer
UNION
SELECT person from Nurse
UNION
SELECT person From Doctor;

CREATE VIEW IF NOT EXISTS AllAssignedLocations AS
SELECT location FROM Extern
UNION
SELECT location FROM SurgeryRoom
UNION
SELECT location FROM IntensiveCareRoom
UNION
SELECT location FROM NormalCareRoom
UNION
SELECT location FROM Office;

CREATE VIEW IF NOT EXISTS AllAssignedServices AS
SELECT service FROM Appointment
UNION
SELECT service FROM Surgery
UNION
SELECT service from AMBULANCE;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_manager
BEFORE
INSERT ON Manager
WHEN
    new.person IN AllAssignedWorkers
BEGIN
    SELECT raise(abort, 'Person already has an assigned work');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_maintenance
BEFORE
INSERT ON Maintenance
WHEN
    new.person IN AllAssignedWorkers
BEGIN
    SELECT raise(abort, 'Person already has an assigned work');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_volunteer
BEFORE
INSERT ON Volunteer
WHEN
    new.person IN AllAssignedWorkers
BEGIN
    SELECT raise(abort, 'Person already has an assigned work');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_nurse
BEFORE
INSERT ON Nurse
WHEN
    new.person IN AllAssignedWorkers
BEGIN
    SELECT raise(abort, 'Person already has an assigned work');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_doctor
BEFORE
INSERT ON Doctor
WHEN
    new.person IN AllAssignedWorkers
BEGIN
    SELECT raise(abort, 'Person already has an assigned work');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_extern
BEFORE
INSERT ON Extern
WHEN
    new.location IN AllAssignedLocations
BEGIN
    SELECT raise(abort, 'Location already has an assigned type');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_surgery_room
BEFORE
INSERT ON SurgeryRoom
WHEN
    new.location IN AllAssignedLocations
BEGIN
    SELECT raise(abort, 'Location already has an assigned type');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_intensive_care_room
BEFORE
INSERT ON IntensiveCareRoom
WHEN
    new.location IN AllAssignedLocations
BEGIN
    SELECT raise(abort, 'Location already has an assigned type');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_normal_care_room
BEFORE
INSERT ON NormalCareRoom
WHEN
    new.location IN AllAssignedLocations
BEGIN
    SELECT raise(abort, 'Location already has an assigned type');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_office
BEFORE
INSERT ON Office
WHEN
    new.location IN AllAssignedLocations
BEGIN
    SELECT raise(abort, 'Location already has an assigned type');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_appointment
BEFORE
INSERT ON Appointment
WHEN
    new.service IN AllAssignedServices
BEGIN
    SELECT raise(abort, 'Service already has an assigned type');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_surgery
BEFORE
INSERT ON Surgery
WHEN
    new.service IN AllAssignedServices
BEGIN
    SELECT raise(abort, 'Service already has an assigned type');
END;

CREATE TRIGGER IF NOT EXISTS ensure_disjoint_ambulance
BEFORE
INSERT ON Ambulance
WHEN
    new.service IN AllAssignedServices
BEGIN
    SELECT raise(abort, 'Service already has an assigned type');
END;