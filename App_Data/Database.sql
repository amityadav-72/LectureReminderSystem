CREATE TABLE Users (
    UserID INT IDENTITY PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Username VARCHAR(50),
    Password VARCHAR(50),
    Role VARCHAR(20) -- Teacher / Student
);

CREATE TABLE Lectures (
    LectureID INT IDENTITY PRIMARY KEY,
    CourseName VARCHAR(100),
    SubjectName VARCHAR(100),
    FacultyName VARCHAR(100),
    LectureDate DATE,
    LectureTime TIME,
    VideoURL VARCHAR(255),
    TeacherID INT
);

CREATE TABLE Reminders (
    ReminderID INT IDENTITY PRIMARY KEY,
    LectureID INT,
    StudentID INT,
    ReminderStatus BIT
);
