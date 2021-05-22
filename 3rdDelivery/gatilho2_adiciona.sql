.mode	columns
.headers	on
.nullvalue	NULL
PRAGMA foreign_keys = ON;

CREATE VIEW IF NOT EXISTS MaintenancePersons AS
SELECT person FROM Maintenance as M
JOIN
MaintenanceJob
ON (M.person = MaintenanceJob.maintenance);

CREATE VIEW IF NOT EXISTS VisitorNumber AS
SELECT person FROM Visitor as V
JOIN
VisitTime
ON (V.person = VisitTime.visitor);

CREATE TRIGGER IF NOT EXISTS Only3PersonOnMaintenanceJob
BEFORE
INSERT ON MaintenanceJob
BEGIN
    IF COUNT(MaintenancePersons) > 3 THEN
        SELECT raise(abort, 'Already 3 persons working on that job');
    END IF;
    
END; 

CREATE TRIGGER IF NOT EXISTS Only3VisitorsPerPacient
BEFORE
INSERT ON VisitTime
BEGIN
    IF COUNT(VisitorNumber) > 3 THEN
        SELECT raise(abort, 'Already 3 visitors');
    END IF;
END; 