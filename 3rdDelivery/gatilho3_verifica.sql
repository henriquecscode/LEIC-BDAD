PRAGMA foreign_keys = ON;

-- Verify that a doctor has the specialization of the surgery room the service relates to

-- Let's create some new specializations
INSERT INTO Specialization VALUES('Dermathology');
INSERT INTO Specialization VALUES('Pathology');

-- Verify that the example in our povoar.sql works
DELETE FROM DoctorService where service =4 and doctor = 4;
Select * from DoctorService;
INSERT INTO DoctorService VALUES(4,4);
Select * from DoctorService;
-- Was able to insert without any troubles

-- Let's create a new surgery room for orthodonty
INSERT INTO LOCATION VALUES(6,301,3011);
INSERT INTO SurgeryRoom VALUES(6, 'Orthodonty');

-- Let's create a service that uses that surgery room
INSERT INTO Service Values(5, NULL, NULL, 100, '2021-04-03 18:00:00', '2021-04-03 19:00:00', 6, 5);

-- Now let's verify that the doctor will not be able to be assigned that service
INSERT INTO DoctorService Values(4,5);

-- Let's create a doctor with the Orthodonty specialization
INSERT INTO WORKER VALUES(5);
INSERT INTO Doctor VALUES(5, 2, 1000);
INSERT INTO DoctorService VALUES(5,5);

-- He cannot yet perform that surgery
INSERT INTO DoctorSpecialization VALUES(5, 'Orthodonty');
SELECT * from DoctorService;
-- He will not be able to perform the surgery
INSERT INTO DoctorService VALUES(5,5);
SELECT * from DoctorService;