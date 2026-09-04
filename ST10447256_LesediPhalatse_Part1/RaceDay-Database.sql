--CREATE DATABASE RaceDayDB;
USE RaceDayDB;


CREATE TABLE UserRole
(
    RoleId INT IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Organizers
(
    OrganiserId INT IDENTITY(1,1) PRIMARY KEY,
    RoleId INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20),
    CreatedAt DATETIME2 DEFAULT GETDATE(),

    FOREIGN KEY (RoleId) REFERENCES UserRole(RoleId)
);

CREATE TABLE Participants
(
    ParticipantId INT IDENTITY(1,1) PRIMARY KEY,
    RoleId INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20),
    DateOfBirth DATE NOT NULL,
    CreatedAt DATETIME2 DEFAULT GETDATE(),

    FOREIGN KEY (RoleId) REFERENCES UserRole(RoleId)
);
