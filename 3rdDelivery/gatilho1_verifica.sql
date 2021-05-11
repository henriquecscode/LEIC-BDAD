PRAGMA foreign_keys = ON;

-- DISJOIN WORKERS VERIFICATION

-- Verify that an already assigned worker cannot be assigned somewhere else
-- Worker 0 was already a Manager from povoar.sql
INSERT INTO Manager VALUES(0, 0, 1000);
INSERT INTO Maintenance VALUES(0,0, 1000);
INSERT INTO Volunteer VALUES(0, 'Association 1', 0);
INSERT INTO Nurse VALUES(0, 0, 1000);
INSERT INTO Doctor VALUES(0, 0, 1000);

-- Create a new worker (from an already existing person from povoar.sql) that doesn't have a work yet
INSERT INTO Worker Values(5);

-- Assign it the Manager work
INSERT INTO Manager VALUES(5, 1, 1000);

-- Verify that it cannot be assigned somewhere else
INSERT INTO Maintenance VALUES(5,0, 1000);
INSERT INTO Volunteer VALUES(5, 'Association 2', 0);
INSERT INTO Nurse VALUES(5, 0, 1000);
INSERT INTO Doctor VALUES(5, 0, 1000);

-- EXTENSIVE
-- Verify that it works for every type of assigned worker

-- Maintenance
-- Worker 1 was already a Maintenance from povoar.sql
INSERT INTO Manager VALUES(1, 0, 1000);
INSERT INTO Maintenance VALUES(1,0, 1000);
INSERT INTO Volunteer VALUES(1, 'Association 31', 0);
INSERT INTO Nurse VALUES(1, 0, 1000);
INSERT INTO Doctor VALUES(1, 0, 1000);

-- Volunteer
-- Worker 2 was already a Volunteer from povoar.sql
INSERT INTO Manager VALUES(2, 0, 1000);
INSERT INTO Maintenance VALUES(2,0, 1000);
INSERT INTO Volunteer VALUES(2, 'Association 4', 0);
INSERT INTO Nurse VALUES(2, 0, 1000);
INSERT INTO Doctor VALUES(2, 0, 1000);

-- Nurse
-- Worker 3 was already a Volunteer from povoar.sql
INSERT INTO Manager VALUES(3, 0, 1000);
INSERT INTO Maintenance VALUES(3,0, 1000);
INSERT INTO Volunteer VALUES(3, 'Association 5', 0);
INSERT INTO Nurse VALUES(3, 0, 1000);
INSERT INTO Doctor VALUES(3, 0, 1000);

-- Maintenance
-- Worker 4 was already a Volunteer from povoar.sql
INSERT INTO Manager VALUES(4, 0, 1000);
INSERT INTO Maintenance VALUES(4,0, 1000);
INSERT INTO Volunteer VALUES(4, 'Association 1', 0);
INSERT INTO Nurse VALUES(4, 0, 1000);
INSERT INTO Doctor VALUES(4, 0, 1000);

-- DISJOINT LOCATIONS VERIFICATION

-- Verify that an already assigned location cannot be assigned somewhere else
-- Location 0 was already an Extern from povoar.sql
INSERT INTO Extern VALUES(0, 'Rua X1');
INSERT INTO SurgeryRoom VALUES(0, 'General');
INSERT INTO IntensiveCareRoom VALUES(0, 0,0);
INSERT INTO NormalCareRoom VALUES(0);
INSERT INTO Office VALUES(0);

-- Create a new location that doesn't have a type yet
INSERT INTO Location Values(6, NULL, NULL);

-- Assign it the extern type
INSERT INTO Extern VALUES(6, 'Rua Y');

-- Verify that it cannot be assigned somewhere else;
INSERT INTO SurgeryRoom VALUES(6, 'General');
INSERT INTO IntensiveCareRoom VALUES(6, 0,0);
INSERT INTO NormalCareRoom VALUES(6);
INSERT INTO Office VALUES(6);

-- EXTENSIVE
-- Verify that it works for every type of assigned Location

-- SurgeryRoom
-- Location 1 was already a SurgeryRoom from povoar.sql
INSERT INTO Extern VALUES(1, 'Rua X2');
INSERT INTO SurgeryRoom VALUES(1, 'General');
INSERT INTO IntensiveCareRoom VALUES(1, 0,0);
INSERT INTO NormalCareRoom VALUES(1);
INSERT INTO Office VALUES(1);

-- Location 2 was already a IntensiveCareRoom from povoar.sql
INSERT INTO Extern VALUES(2, 'Rua X3');
INSERT INTO SurgeryRoom VALUES(2, 'General');
INSERT INTO IntensiveCareRoom VALUES(2, 0,0);
INSERT INTO NormalCareRoom VALUES(2);
INSERT INTO Office VALUES(2);

-- Location 3 was already a NormalCareRoom from povoar.sql
INSERT INTO Extern VALUES(3, 'Rua X4');
INSERT INTO SurgeryRoom VALUES(3, 'General');
INSERT INTO IntensiveCareRoom VALUES(3, 0,0);
INSERT INTO NormalCareRoom VALUES(3);
INSERT INTO Office VALUES(3);

-- Location 4 was already an Office from povoar.sql
INSERT INTO Extern VALUES(4, 'Rua X5');
INSERT INTO SurgeryRoom VALUES(4, 'General');
INSERT INTO IntensiveCareRoom VALUES(4, 0,0);
INSERT INTO NormalCareRoom VALUES(4);
INSERT INTO Office VALUES(4);

-- DISJOINT SERVICES VERIFICATION

-- Verify that an already assigned service cannot be assigned something else
-- Service 0 was already an Ambulance from povoar.sql
INSERT INTO Appointment VALUES(0);
INSERT INTO Surgery VALUES(0);
INSERT INTO Ambulance VALUES(0, 1, 1);


-- Create a new Service that doesn't have a type yet
INSERT INTO Service Values(5, NULL, NULL, 100, '2021-04-04 18:00:00', '2021-04-04 19:00:00', 1, 5);

-- Assign it the Ambulance type
INSERT INTO Ambulance VALUES(5, 2, 1);

-- Verify that it cannot be assigned something else;
INSERT INTO Appointment VALUES(0);
INSERT INTO Surgery VALUES(0);

-- EXTENSIVE
-- Verify that it works for every type of assigned Service

-- Appointment
-- Service 2 was already an Appointment from povoar.sql
INSERT INTO Appointment VALUES(2);
INSERT INTO Surgery VALUES(2);
INSERT INTO Ambulance VALUES(2, 3, 1);

-- Surgery
-- Service 4 was already an Appointment from povoar.sql
INSERT INTO Appointment VALUES(4);
INSERT INTO Surgery VALUES(4);
INSERT INTO Ambulance VALUES(4, 4, 1);