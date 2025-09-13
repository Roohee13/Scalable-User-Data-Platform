-- LOG: create_triggers.sql: Starting execution...


USE UserManagementDB;

-- LOG: Dropping existing triggers if they exist...

DROP TRIGGER IF EXISTS AfterUserInsert;
DROP TRIGGER IF EXISTS RecordCreationTime;

-- LOG: Existing triggers dropped successfully.


DELIMITER //

CREATE TRIGGER AfterUserInsert
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    
    INSERT INTO UserProfiles (UserID) VALUES (NEW.UserID);
    
    INSERT INTO _TriggerLogs (Message, CreatedAt) 
    VALUES (CONCAT('UserProfile created for new UserID ', NEW.UserID), NOW());
END;

//

DELIMITER ;

-- LOG: AfterUserInsert trigger created successfully.


DELIMITER //

CREATE TRIGGER RecordCreationTime
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    
    INSERT INTO UserAudit (UserID, CreationTime, ActionPerformed)
    VALUES (NEW.UserID, NOW(), 'INSERT');
    
    
    INSERT INTO _TriggerLogs (Message, CreatedAt) 
    VALUES (CONCAT('Audit record created for new UserID ', NEW.UserID), NOW());
END;

//

DELIMITER ;

-- LOG: RecordCreationTime trigger created successfully.

-- LOG: create_triggers.sql: Execution finished successfully.