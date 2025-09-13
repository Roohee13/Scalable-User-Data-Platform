-- LOG: create_tables.sql: Starting execution...


USE UserManagementDB;

-- LOG: Dropping existing tables if they exist...


DROP TABLE IF EXISTS _TriggerLogs;
DROP TABLE IF EXISTS UserAudit;
DROP TABLE IF EXISTS UserProfiles;
DROP TABLE IF EXISTS Users;

-- LOG: Existing tables dropped successfully.


CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    DateCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- LOG: CREATE TABLE Users completed successfully.


CREATE TABLE UserProfiles (
    ProfileID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL UNIQUE,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- LOG: CREATE TABLE UserProfiles completed successfully.


CREATE TABLE UserAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    CreationTime DATETIME NOT NULL,
    ActionPerformed VARCHAR(50) DEFAULT 'INSERT',  -- insert,update,delete,login
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- LOG: CREATE TABLE UserAudit completed successfully.


CREATE TABLE _TriggerLogs (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    Message VARCHAR(255) NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- LOG: CREATE TABLE _TriggerLogs completed successfully.

-- LOG: create_tables.sql: Execution finished successfully.