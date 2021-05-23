PRAGMA foreign_keys = ON;

DROP VIEW IF EXISTS MaintenancePersons;
DROP VIEW IF EXISTS VisitorNumber;
DROP TRIGGER IF EXISTS Only3PersonOnMaintenanceJob;
DROP TRIGGER IF EXISTS Only3VisitorsPerPacient;