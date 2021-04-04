PRAGMA foreign_keys = ON;

/*Person*/
INSERT INTO Person Values(0, 'Ana', '2000-01-01', NULL, NULL, 'F', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Person Values(1, 'Ben', '2000-01-02', NULL, NULL, 'M', 911111111, NULL, NULL, NULL, NULL);
INSERT INTO Person Values(2, 'Charlie', '2000-01-03', NULL, NULL, 'M', 911111112, 153111111, NULL, NULL, NULL);
INSERT INTO Person Values(3, 'Daniel', '2000-01-04', NULL, NULL, 'M', 911111113, 153111112, 'daniel@example.com', NULL, NULL);
INSERT INTO Person Values(4, 'Eleanor', '2000-01-05', NULL, NULL, 'F', 911111114, 153111113, 'eleanor@example.com', 'Eleanors Street 1', NULL);
INSERT INTO Person Values(5, 'Francis', '2000-01-06', NULL, NULL, 'M', 911111115, 153111114, 'francis@example.com', 'Francis Street 1', 10000001);
INSERT INTO Person Values(6, 'Gustav', '2000-01-07', NULL, NULL, 'M', 911111116, 153111115, 'gustav@example.com', 'Gustav Street 1', 10000002);

/*Department*/
INSERT INTO Department Values(0, 1);
INSERT INTO Department Values(1, 1);
INSERT INTO Department Values(2, 2);
INSERT INTO Department Values(3, 3);
INSERT INTO Department Values(4, 4);

/*Location*/
INSERT INTO Location Values(0, NULL, NULL);
INSERT INTO Location Values(1, 100, 1001);
INSERT INTO Location Values(2, 100, 1002);
INSERT INTO Location Values(3, 101, 1011);
INSERT INTO Location Values(4, 200, 2001);
INSERT INTO Location Values(5, 300, 3001);

/*Shift*/
INSERT INTO Shift Values(0, 1, '00:00:00', 1, '08:00:00');
INSERT INTO Shift Values(1, 1, '08:00:00', 1, '16:00:00');
INSERT INTO Shift Values(2, 1, '16:00:00', 2, '24:00:00');
INSERT INTO Shift Values(3, 2, '00:00:00', 2, '08:00:00');
INSERT INTO Shift Values(4, 2, '01:00:00', 4, '00:00:00');
INSERT INTO Shift Values(5, 6, '00:00:00', 1, '00:00:00');
INSERT INTO Shift Values(6, 6, '00:00:00', 0, '00:00:00');

/*
This are supposed to fail on insertion
INSERT INTO Shift Values(7, 6, '00:00:00', 3, '00:00:00');
INSERT INTO Shift Values(8, 6, '00:00:00', 2, '00:00:00');
INSERT INTO Shift Values(9, 6, '09:00:00', 1, '10:00:00');
*/

/*Specialization*/
INSERT INTO Specialization Values('General');
INSERT INTO Specialization Values('Orthodonty');
INSERT INTO Specialization Values('Neurology');

/*Worker*/
INSERT INTO Worker Values(0, 0);
INSERT INTO Worker Values(1, 0);
INSERT INTO Worker Values(2, 0);
INSERT INTO Worker Values(3, 1);
INSERT INTO Worker Values(4, 1);

/*WorkerShift*/
INSERT INTO WorkerShift Values(0,0);
INSERT INTO WorkerShift Values(0,1);
INSERT INTO WorkerShift Values(0,2);
INSERT INTO WorkerShift Values(0,3);
INSERT INTO WorkerShift Values(1,0);
INSERT INTO WorkerShift Values(2,0);
INSERT INTO WorkerShift Values(3,0);
INSERT INTO WorkerShift Values(4,0);

/*Manager*/
INSERT INTO Manager Values(0, 0, 1500);

/*Maintenance*/
INSERT INTO Maintenance Values(1, 0, 1000);

/*Volunteer*/
INSERT INTO Volunteer Values(2, 'Association A', 1);

/*Nurse*/
INSERT INTO Nurse Values(3, 1, 1500);

/*Doctor*/
INSERT INTO Doctor Values(4, 2, 1000);

/*DoctorSpecialization*/
INSERT INTO DoctorSpecialization Values(4, 'General');
INSERT INTO DoctorSpecialization Values(4, 'Neurology');

/*Client*/
INSERT INTO Client Values(1);
INSERT INTO Client Values(5);
INSERT INTO Client Values(6);

/*Patient*/
INSERT INTO Patient Values(5);

/*Visitor*/
INSERT INTO Visitor Values(1);
INSERT INTO Visitor Values(6);

/*VisitTime*/
INSERT INTO VisitTime Values(5, 1, '2021-04-03 12:00:00', '2021-04-03 13:00:00', 1);
INSERT INTO VisitTime Values(5, 6, '2021-04-03 13:00:00', '2021-04-03 14:00:00', 2);

/*Service*/
INSERT INTO Service Values(0, NULL, NULL, 100, '2021-04-03 10:00:00', '2021-04-03 11:00:00', 0, 5);
INSERT INTO Service Values(1, NULL, NULL, 100, '2021-04-03 11:00:00', '2021-04-03 12:00:00', 4, 5);
INSERT INTO Service Values(2, NULL, NULL, 100, '2021-04-03 12:00:00', '2021-04-03 17:00:00', 3, 5);
INSERT INTO Service Values(3, NULL, NULL, 100, '2021-04-03 17:00:00', '2021-04-03 18:00:00', 2, 5);
INSERT INTO Service Values(4, NULL, NULL, 100, '2021-04-03 18:00:00', '2021-04-03 19:00:00', 1, 5);

/*NurseService*/
INSERT INTO NurseService Values(3, 0);
INSERT INTO NurseService Values(3, 2);
INSERT INTO NurseService Values(3, 3);

/*DoctorService*/
INSERT INTO DoctorService Values(4, 1);
INSERT INTO DoctorService Values(4, 3);
INSERT INTO DoctorService Values(4, 4);

/*Appointment*/
INSERT INTO Appointment Values(2);
INSERT INTO Appointment Values(3);
INSERT INTO Appointment Values(4);

/*Surgery*/
INSERT INTO Surgery Values(4);

/*Ambulance*/
INSERT INTO Ambulance Values(0, 1, 1);

/*MaintenaceJob*/
INSERT INTO MaintenanceJob Values(0, 1, '2021-04-02', 1, 1);

/*Extern*/
INSERT INTO Extern Values(0, "Rua x");

/*SurgeryRoom*/
INSERT INTO SurgeryRoom Values(1);

/*IntensiveCareRoom*/
INSERT INTO IntensiveCareRoom Values(2, 0, 0);

/*NormalCareRoom*/
INSERT INTO NormalCareRoom Values(3);

/*Office*/
INSERT INTO Office Values(4);