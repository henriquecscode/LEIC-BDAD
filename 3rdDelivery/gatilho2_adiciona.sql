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
WHEN (select count(*) from MaintenancePersons) > 3
BEGIN
        SELECT raise(abort, 'Already 3 persons working on that job');
END; 

CREATE TRIGGER IF NOT EXISTS Only3VisitorsPerPacient
BEFORE
INSERT ON VisitTime
WHEN (select count(*) from VisitorNumber) > 3
BEGIN
    SELECT raise(abort, 'Already 3 visitors');
END; 