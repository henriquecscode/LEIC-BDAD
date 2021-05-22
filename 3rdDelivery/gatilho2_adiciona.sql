.mode	columns
.headers	on
.nullvalue	NULL
PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS Only3PersonOnMaintenanceJob
BEFORE
INSERT ON MaintenanceJob
BEGIN
    IF COUNT(old.maintenance) > 3 THEN
        SELECT raise(abort, 'Already 3 persons working on that job');
    END IF;
    
END; 

CREATE TRIGGER IF NOT EXISTS Only3VisitorsPerPacient
BEFORE
INSERT ON Visitor
BEGIN
    IF COUNT(old.person) > 3 THEN
        SELECT raise(abort, 'Already 3 visitors');
    END IF;
END; 