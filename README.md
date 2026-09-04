# RaceDay

### South African Road Event Management System

RaceDay is a full-stack web-based event management system designed for the South African road running, walking and cycling community.

The project aims to provide a central platform where event organisers can manage events, categories, enrolments and participant results, while participants can discover upcoming events, enter race categories and track their personal performance history.

This project forms part of my **Portfolio of Evidence (POE)** and is being developed progressively across three parts.

---

## Project Background

South Africa has a strong road-event culture, with events ranging from major races such as the Comrades Marathon, Soweto Marathon and Two Oceans Marathon to smaller community runs, walks and cycling events.

Many events still depend on spreadsheets, paper-based registration and disconnected communication methods.

RaceDay is designed to demonstrate how a modern web-based system could bring these processes together into one structured platform.

---

## Project Objectives

The main objectives of RaceDay are to:

- Provide a central platform for managing road events.
- Allow organisers to create and manage events.
- Allow organisers to create different categories for each event.
- Allow participants to browse available events.
- Allow participants to enter an event by selecting a category.
- Allow organisers to view event enrolments.
- Allow organisers to capture participant results.
- Allow participants to track their personal race results.
- Apply role-based access for organisers and participants.
- Develop the system using an API-driven architecture.

---

## User Roles

RaceDay supports two main user roles.

### Organiser

An organiser can:

- Create events
- Edit events
- Delete events
- Manage event categories
- View event enrolments
- Capture participant results
- Update participant results

### Participant

A participant can:

- Create an account
- Log into RaceDay
- Browse upcoming events
- View event information
- View available event categories
- Enter an event category
- View personal enrolments
- Cancel an enrolment
- View personal race results
- Track performance history

---

# Project Development

The RaceDay POE is divided into three parts.

## Part 1 – System Planning and Database

Part 1 focuses on planning the system before application development begins.

The work includes:

- Entity Relationship Diagram (ERD)
- Database entities and relationships
- Primary and foreign key planning
- API endpoint planning
- SQL Server database script
- Sample database data
- GitHub repository management
- GitHub Actions CI validation

### Part 1 Status

**In Progress**

---

## Part 2 – RESTful API

Part 2 will focus on implementing the RaceDay backend using C#.

Planned work includes:

- ASP.NET Core Web API
- Database connectivity
- Authentication
- Role-based authorisation
- Organiser API functionality
- Participant API functionality
- Event management
- Category management
- Event enrolments
- Participant results
- Unit testing
- GitHub CI/CD

---

## Part 3 – MVC Web Application

Part 3 will build the user-facing RaceDay web application.

Planned work includes:

- ASP.NET Core MVC
- RaceDay API integration
- Organiser interface
- Participant interface
- Event browsing
- Event registration
- Results tracking
- Azure Blob Storage integration
- Docker containerisation
- Cloud-aware deployment

---

# Database Design

The RaceDay database currently consists of the following main entities:

| Entity | Purpose |
| --- | --- |
| **UserRole** | Stores the available system roles |
| **Organizers** | Stores organiser account and profile information |
| **Participants** | Stores participant account and profile information |
| **Events** | Stores running, walking and cycling events |
| **EventCategories** | Stores the categories available for each event |
| **Enrolments** | Records participants entering event categories |
| **Results** | Stores participant race results |

---

## Main Database Relationships

The main relationships within RaceDay are:

- One **UserRole** can be associated with multiple organisers.
- One **UserRole** can be associated with multiple participants.
- One **Organiser** can create multiple events.
- One **Event** can contain multiple event categories.
- One **Participant** can have multiple enrolments.
- One **EventCategory** can receive multiple enrolments.
- One **Enrolment** can have zero or one result.

The general database flow can be represented as:

```text
ORGANIZER
    |
    v
  EVENT
    |
    v
EVENT CATEGORY
    ^
    |
ENROLMENT <---- PARTICIPANT
    |
    v
  RESULT
```

---

# Entity Relationship Diagram

The ERD was created during Part 1 to plan the RaceDay database before API development.

It includes the entities, attributes, primary keys, foreign keys and relationships required by the system.

![RaceDay ERD](docs/RaceDay-ERD.png)

---

# API Planning

The RESTful API is planned around the two RaceDay user roles.

### Participant API

Participant endpoints will support:

```text
Register / Login
        ↓
Browse Events
        ↓
View Event Categories
        ↓
Enter Category
        ↓
View Enrolments
        ↓
View Results
```

### Organiser API

Organiser endpoints will support:

```text
Register / Login
        ↓
Create Event
        ↓
Manage Categories
        ↓
View Enrolments
        ↓
Capture Results
        ↓
Manage Results
```

Role-based access will be enforced when the API is implemented in Part 2.

---

# SQL Database

The RaceDay database is designed for **Microsoft SQL Server**.

The SQL script includes:

- Database creation
- Table creation
- Primary keys
- Foreign keys
- Unique constraints
- Default values
- Sample organisers
- Sample participants
- Sample events
- Event categories
- Sample enrolments
- Sample results
- Testing queries

The SQL script can be found at:

```text
/docs/RaceDay-Database.sql
```

---

# Repository Structure

```text
RaceDay/
│
├── docs/
│   ├── RaceDay-Database.sql
│   ├── RaceDay-ERD.png
│   └── ST10447256_LesediPhalatse_POE_Part1.pdf
│
├── .github/
│   └── workflows/
│       └── validate-part1.yml
│
├── README.md
│
└── .gitignore
```

The `/docs` folder contains the planning documents and SQL database work completed during Part 1.

---

# Technologies

The project is planned around the following technologies:

| Technology | Purpose |
| --- | --- |
| **C#** | Backend development |
| **ASP.NET Core Web API** | RESTful API |
| **ASP.NET Core MVC** | Web application |
| **SQL Server** | Relational database |
| **SSMS** | Database development and testing |
| **Git** | Version control |
| **GitHub** | Source-code repository |
| **GitHub Actions** | CI/CD and repository validation |
| **Azure Blob Storage** | File storage in Part 3 |
| **Docker** | Application containerisation in Part 3 |

---

# Running the Part 1 Database

### 1. Clone the repository

```bash
git clone https://github.com/lesediphaltse13/RaceDay.git
```

### 2. Open SQL Server Management Studio

Connect to a local SQL Server instance.

### 3. Open the database script

Navigate to:

```text
docs/RaceDay-Database.sql
```

### 4. Execute the script

Run the SQL script in SSMS.

The script creates the RaceDay database, tables, relationships and sample data required for testing.

---

# CI/CD

GitHub Actions will be used to validate the RaceDay repository.

For Part 1, the workflow checks that the required project documentation and repository structure are available.

A successful workflow run will be included in the final POE documentation.

### GitHub Actions Status

> CI workflow will be completed as part of the Part 1 submission requirements.

---

# Part 1 Documentation

The complete Part 1 submission contains:

- Section A – Entity Relationship Diagram
- Section B – API Endpoint Plan
- Section C – SQL Database Script
- GitHub repository evidence
- CI/CD evidence
- Supporting explanations and references

The documentation can be found inside the `/docs` folder.

---

# Future Development

RaceDay will continue to develop throughout Parts 2 and 3.

Future functionality will include:

- Secure authentication
- Role-based API authorisation
- Event management dashboard
- Participant dashboard
- Personal performance history
- Live weather information
- Route information
- Azure Blob Storage
- Unit testing
- MVC integration
- Docker containerisation
- Cloud-aware deployment

---

# Developer

**Lesedi Phalatse**

Diploma in Information Technology in Software Development

South Africa 🇿🇦

---

## Academic Project

RaceDay is an individual academic project developed as part of a Portfolio of Evidence.

The repository documents the planning and progressive development of a full-stack event management system using real-world software development practices.
