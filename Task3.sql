CREATE DATABASE EventsManagement;

USE EventsManagement;

CREATE TABLE Events (
    Event_Id INT IDENTITY(1,1) PRIMARY KEY,
    Event_Name VARCHAR(255) NOT NULL,
    Event_Date DATE NOT NULL,
    Event_Location VARCHAR(255),
    Event_Description TEXT
);
GO

CREATE TABLE Attendees (
    Attendee_Id INT IDENTITY(1,1) PRIMARY KEY,
    Attendee_Name VARCHAR(255) NOT NULL,
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(255) UNIQUE NOT NULL,
    Attendee_City VARCHAR(255)
);
GO

CREATE TABLE Registrations (
    Registration_Id INT IDENTITY(1,1) PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE NOT NULL,
    Registration_Amount DECIMAL(10, 2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);
GO



INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
('Tech Conference 2024', '2024-12-15', 'New York Convention Center', 'A conference focused on emerging technologies.'),
('Music Festival 2024', '2024-11-30', 'Central Park, New York', 'A music festival featuring local and international artists.'),
('Health & Wellness Expo', '2024-12-05', 'Los Angeles Convention Center', 'An expo focused on health, fitness, and wellness.');

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
('John Doe', '555-1234', 'johndoe@example.com', 'New York'),
('Alice Smith', '555-5678', 'alicesmith@example.com', 'Los Angeles'),
('Bob Johnson', '555-8765', 'bobjohnson@example.com', 'Chicago'),
('Emma Brown', '555-4321', 'emmabrown@example.com', 'San Francisco');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
(1, 1, '2024-11-10', 199.99),
(1, 2, '2024-11-12', 199.99),
(2, 3, '2024-11-20', 89.50),
(3, 4, '2024-11-22', 49.99);



--3a
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
('International Business Summit 2024', '2024-12-05', 'Taj Hotel, Mumbai', 'A global summit for networking, business discussions, and industry growth.');


--3b
UPDATE Events
SET 
    Event_Location = 'Grand Hyatt, New York',
    Event_Description = 'An expanded conference covering more topics in technology, innovation, and trends.'
WHERE Event_Id = 1;


--3c
DELETE FROM Registrations
WHERE Event_Id = 4;

DELETE FROM Events
WHERE Event_Id = 4;


--4a
INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
('Suresh Kumar', 9988776655, 'suresh.kumar@example.com', 'Chennai');

--4b
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES (2, 2, '2024-12-01', 150.00);


--5
SELECT Event_Id, Event_Name, Event_Date, Event_Location, Event_Description
FROM Events
ORDER BY Event_Date DESC;



SELECT A.Attendee_Name, A.Attendee_City
FROM Attendees A
JOIN Registrations R ON A.Attendee_Id = R.Attendee_Id
WHERE R.Event_Id = 2
ORDER BY A.Attendee_Name;

SELECT E.Event_Name, COUNT(R.Attendee_Id) AS Total_Attendees
FROM Events E
LEFT JOIN Registrations R ON E.Event_Id = R.Event_Id
GROUP BY E.Event_Name
ORDER BY Total_Attendees DESC;


SELECT E.Event_Name, SUM(R.Registration_Amount) AS Total_Revenue
FROM Events E
JOIN Registrations R ON E.Event_Id = R.Event_Id
GROUP BY E.Event_Name
ORDER BY Total_Revenue DESC;

SELECT A.Attendee_Name, E.Event_Name, R.Registration_Amount
FROM Attendees A
JOIN Registrations R ON A.Attendee_Id = R.Attendee_Id
JOIN Events E ON R.Event_Id = E.Event_Id
ORDER BY E.Event_Date DESC, A.Attendee_Name;


SELECT AVG(Attendees_Count) AS Average_Attendees_Per_Event
FROM (
    SELECT COUNT(Attendee_Id) AS Attendees_Count
    FROM Registrations
    GROUP BY Event_Id
) AS Event_Attendees;

SELECT E.Event_Name
FROM Events E
LEFT JOIN Registrations R ON E.Event_Id = R.Event_Id
WHERE R.Attendee_Id IS NULL;






