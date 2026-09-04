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

CREATE TABLE Events
(
    EventId INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserId INT NOT NULL,
    EventName VARCHAR(120) NOT NULL,
    Description VARCHAR(500),
    EventType VARCHAR(30) NOT NULL,
    EventDate DATETIME2 NOT NULL,
    RegistrationClosingDate DATETIME2 NOT NULL,
    Venue VARCHAR(150) NOT NULL,
    City VARCHAR(80) NOT NULL,
    Province VARCHAR(50) NOT NULL,
    RouteInformation VARCHAR(500),
    CreatedAt DATETIME2 DEFAULT GETDATE(),

    FOREIGN KEY (OrganiserId) REFERENCES Organizers(OrganiserId)
);

CREATE TABLE EventCategories
(
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    CategoryName VARCHAR(100) NOT NULL,
    DistanceKm DECIMAL(6,2) NOT NULL,
    EntryFee DECIMAL(10,2) NOT NULL,
    MaximumParticipants INT,
    CreatedAt DATETIME2 DEFAULT GETDATE(),

    FOREIGN KEY (EventId) REFERENCES Events(EventId)
);

CREATE TABLE Enrolments
(
    EnrolmentId INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantId INT NOT NULL,
    CategoryId INT NOT NULL,
    EnrolmentDate DATETIME2 DEFAULT GETDATE(),
    Status VARCHAR(30) NOT NULL,
    RaceNumber VARCHAR(30) UNIQUE,

    FOREIGN KEY (ParticipantId) REFERENCES Participants(ParticipantId),
    FOREIGN KEY (CategoryId) REFERENCES EventCategories(CategoryId),

    UNIQUE (ParticipantId, CategoryId)
);

CREATE TABLE Results
(
    ResultId INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentId INT NOT NULL UNIQUE,
    FinishTime TIME,
    Position INT,
    Status VARCHAR(30) NOT NULL,
    RecordedAt DATETIME2 DEFAULT GETDATE(),

    FOREIGN KEY (EnrolmentId) REFERENCES Enrolments(EnrolmentId)
);

-- Insert user roles

INSERT INTO UserRole (RoleName)
VALUES
('Organiser'),
('Participant');

-- Insert organisers

INSERT INTO Organizers
(
    RoleId,
    FirstName,
    LastName,
    Email,
    PasswordHash,
    PhoneNumber
)
VALUES
(
    1,
    'Thabo',
    'Mokoena',
    'thabo@raceday.co.za',
    'password123',
    '0821111111'
),
(
    1,
    'Naledi',
    'Khumalo',
    'naledi@raceday.co.za',
    'password456',
    '0822222222'
);

-- Insert participants

INSERT INTO Participants
(
    RoleId,
    FirstName,
    LastName,
    Email,
    PasswordHash,
    PhoneNumber,
    DateOfBirth
)
VALUES
(
    2,
    'Sipho',
    'Dlamini',
    'sipho@email.com',
    'password123',
    '0831111111',
    '1998-05-14'
),
(
    2,
    'Lerato',
    'Nkosi',
    'lerato@email.com',
    'password456',
    '0832222222',
    '2001-09-20'
);
