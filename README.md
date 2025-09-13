# Scalable-User-Data-Platform
A robust and scalable MySQL-based user management system with comprehensive auditing, logging, and automated testing capabilities.

# 📋 Project Overview

The Scalable User Data Platform is a complete database solution that demonstrates modern user management practices with:

-->User authentication and profile management

-->Comprehensive audit trails

-->Automated logging mechanisms

-->Trigger-based automation

-->Built-in testing procedures

# 🏗️ Database Schema

## Core Tables:

-->Users: Main user authentication table

-->UserProfiles: Extended user information

-->UserAudit: Complete audit trail of user actions

-->_TriggerLogs: System operation logs

## Key Features:

--> Auto-increment primary keys for all tables

--> Referential integrity with foreign key constraints

--> CASCADE delete operations for data consistency

--> Unique constraints on username and email fields

--> Automatic timestamping for all creations and modifications

# 📁 File Structure

     Scalable-User-Data-Platform/
     │
     ├── database/
     │   └── create_database.sql           Database creation script
     │
     ├── schema/
     │   └── create_schema.sql             Schema setup script
     │
     ├── tables/
     │   └── create_tables.sql             Table creation with constraints
     │
     ├── triggers/
     │   └── create_triggers.sql           Automated trigger system
     │
     ├── test/
     │   ├── test_data_procedure.sql       Test data generation
     │   └── result.sql                    Verification queries
     │
     ├── cleanup.sql                       Database cleanup script
     └── README.md                         This file


# 🚀 Installation & Setup

## Prerequisites

--> MySQL Server 8.0 or higher

--> MySQL Workbench (recommended) or command-line client

--> Basic knowledge of SQL and database concepts

## Step-by-Step Execution

   1. Start MySQL Service

          net start MySQL80  //on windows
          sudo systemctl start mysql  // On Linux/Mac

   2. Execute Scripts in Order (Using MySQL Workbench):

      a. Create Database


            SOURCE database/create_database.sql;


      b. Set Up Schema

             SOURCE schema/create_schema.sql;

      
      c. Create Tables


             SOURCE tables/create_tables.sql;

      
      d. Set Up Triggers


             SOURCE triggers/create_triggers.sql;
      
      
     e. Create Test Procedure


              SOURCE test/test_data_procedure.sql;
              
  3. Generate Test Data

               sql
               CALL GenerateTestUsers(100, 'example.com');
     
  4.Verify Results

              SOURCE test/result.sql;

              
# Command Line Execution


    mysql -u root -p < database/create_database.sql
    mysql -u root -p < schema/create_schema.sql
    mysql -u root -p < tables/create_tables.sql
    mysql -u root -p < triggers/create_triggers.sql
    mysql -u root -p < test/test_data_procedure.sql
    mysql -u root -p -e "CALL GenerateTestUsers(50, 'test.com');"
    mysql -u root -p < test/result.sql


# 🔧 Key Components

## Automated Triggers

1. AfterUserInsert: Automatically creates user profiles when new users are added

2. RecordCreationTime: Maintains audit trail of all user creations

## Testing Procedure

1. GenerateTestUsers(): Creates configurable test users with custom domains

2. Comprehensive logging of all operations

3. Parameterized input for flexible testing

## Audit System

1. Tracks all user creation events

2. Timestamps all actions automatically

3. Maintains action history for compliance

# 📊 Sample Usage

## Basic Operations

     sql
     -- Create test users
     CALL GenerateTestUsers(10, 'company.com');

     -- View all users
     SELECT * FROM Users;

     -- Check audit trail
     SELECT * FROM UserAudit;

     -- Review system logs
     SELECT * FROM _TriggerLogs ORDER BY CreatedAt DESC;


## Data Verification

     sql
     -- Verify data integrity
     
     SELECT 
     u.UserID,
     u.Username,
     p.ProfileID,
     a.AuditID,
     a.CreationTime
     FROM Users u
     LEFT JOIN UserProfiles p ON u.UserID = p.UserID
     LEFT JOIN UserAudit a ON u.UserID = a.UserID
     ORDER BY u.UserID;


# 🧹 Maintenance

## Cleanup

     sql
     SOURCE cleanup.sql;
     DROP DATABASE IF EXISTS UserManagementDB;


## Backup

    bash
    // Export database
    mysqldump -u root -p UserManagementDB > backup.sql

   // Import database
   mysql -u root -p UserManagementDB < backup.sql


# 🛠️ Customization
## Adding New Fields

Edit tables/create_tables.sql to add new columns:

      sql
      ALTER TABLE Users 
      ADD COLUMN LastLogin DATETIME NULL AFTER DateCreated;


## Extending Audit System

Modify triggers/create_triggers.sql to track additional events:

     sql
     -- Example: Add update trigger
     CREATE TRIGGER AfterUserUpdate
     AFTER UPDATE ON Users
     FOR EACH ROW
     BEGIN
        INSERT INTO UserAudit (UserID, CreationTime, ActionPerformed)
         VALUES (NEW.UserID, NOW(), 'UPDATE');
     END;


# 📈 Performance Considerations

-->Indexes are automatically created on primary keys

-->Consider adding indexes on frequently queried columns:

       sql
       CREATE INDEX idx_users_email ON Users(Email);
       CREATE INDEX idx_audit_userid ON UserAudit(UserID);
       CREATE INDEX idx_audit_creationtime ON UserAudit(CreationTime);


# 🤝 Contributing

1. Fork the repository

2. Create a feature branch (git checkout -b feature/amazing-feature)

3. Commit changes (git commit -m 'Add amazing feature')

4. Push to branch (git push origin feature/amazing-feature)

5. Open a Pull Request
   

# 📝 License
This project is licensed under the MIT License - see the LICENSE file for details.

# 🆘 Support

For support or questions:

 1. Check the MySQL documentation

 2. Review script comments for detailed explanations

 3. Open an issue in the GitHub repository

# 🔄 Version History

--> 1.0.0 (Current)

--> Initial release

--> Complete user management system

--> Automated auditing and logging

--> Comprehensive testing framework


         
