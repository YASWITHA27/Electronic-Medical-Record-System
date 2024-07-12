-- Creating the Roles table
CREATE TABLE UserRoles (
    Role_id INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(255) UNIQUE NOT NULL
);

-- Insert roles into the Roles table
INSERT INTO UserRoles (RoleName) VALUES ('Provider'), ('Receptionist');

-- Creating the Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    RoleID INT,
    FOREIGN KEY (RoleID) REFERENCES UserRoles(Role_id)
);

-- Add a provider user login for Yaswitha Atluri
INSERT INTO Users (Username, Password, RoleID) 
VALUES ('ayaswitha', 'Yaswitha123', (SELECT Role_id FROM UserRoles WHERE RoleName = 'Provider'));

-- Add a receptionist user login for Maya Johnson
INSERT INTO Users (Username, Password, RoleID) 
VALUES ('jmaya', 'Maya1234', (SELECT Role_id FROM UserRoles WHERE RoleName = 'Receptionist'));

-- Procedure to check user role
DELIMITER $$
CREATE PROCEDURE CheckUserRole(IN userID INT, OUT roleName VARCHAR(255))
BEGIN
    SELECT r.RoleName INTO roleName
    FROM Users u
    INNER JOIN UserRoles r ON u.RoleID = r.Role_id
    WHERE u.UserID = userID;
END$$
DELIMITER ;

-- Procedure for provider login
DELIMITER $$
CREATE PROCEDURE `CheckProviderLogin`(
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255)
)
BEGIN
    SELECT r.RoleName
    FROM Users u
    JOIN UserRoles r ON u.RoleID = r.Role_id
    WHERE u.Username = p_username AND u.Password = p_password AND r.RoleName = 'Provider';
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `CheckReceptionistLogin`(
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255)
)
BEGIN
    SELECT r.RoleName
    FROM Users u
    JOIN UserRoles r ON u.RoleID = r.Role_id
    WHERE u.Username = p_username AND u.Password = p_password AND r.RoleName = 'Receptionist';
END$$
DELIMITER ;




