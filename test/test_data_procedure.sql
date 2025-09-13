-- LOG: test_data_procedure.sql: Starting execution...


USE UserManagementDB;

-- LOG: Dropping existing procedure if it exists...

DROP PROCEDURE IF EXISTS GenerateTestUsers;

-- LOG: Existing procedure dropped successfully.


DELIMITER //

CREATE PROCEDURE GenerateTestUsers(
    IN NumUsers INT,
    IN EmailDomain VARCHAR(100)
)
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE username_val VARCHAR(50);
    DECLARE email_val VARCHAR(100);
    
    
    -- Loop to generate users
    WHILE counter <= NumUsers DO
        SET username_val = CONCAT('testuser', counter);
        SET email_val = CONCAT(username_val, '@', EmailDomain);
        
        -- Log user insertion
        INSERT INTO _TriggerLogs (Message) 
        VALUES (CONCAT('Inserting user ', counter, ' - Username: ', username_val));
        
        -- Insert into Users table (triggers will handle the rest)
        INSERT INTO Users (Username, Email) VALUES (username_val, email_val);
        
        SET counter = counter + 1;
    END WHILE;
    
    
END;

//

DELIMITER ;


-- CALL GenerateTestUsers(5, 'outlook.com');

-- LOG: test_data_procedure.sql: Execution finished successfully.
