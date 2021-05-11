PRAGMA foreign_keys = ON;

DROP VIEW IF EXISTS AllAssignedWorkers;
DROP VIEW IF EXISTS AllAssignedLocations;

DROP TRIGGER IF EXISTS ensure_disjoint_manager;
DROP TRIGGER IF EXISTS ensure_disjoint_maintenance;
DROP TRIGGER IF EXISTS ensure_disjoint_volunteer;
DROP TRIGGER IF EXISTS ensure_disjoint_nurse;
DROP TRIGGER IF EXISTS ensure_disjoint_doctor;

DROP TRIGGER IF EXISTS ensure_disjoint_extern;
DROP TRIGGER IF EXISTS ensure_disjoint_surgery_room;
DROP TRIGGER IF EXISTS ensure_disjoint_intensive_care_room;
DROP TRIGGER IF EXISTS ensure_disjoint_normal_care_room;
DROP TRIGGER IF EXISTS ensure_disjoint_office;