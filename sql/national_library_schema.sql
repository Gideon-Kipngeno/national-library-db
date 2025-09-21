-- Create the database
CREATE DATABASE IF NOT EXISTS NationalLibrary;
USE NationalLibrary;

--xxxxxxxxxxxxxxxxxxxxxxxxxxxx
-- Reference Tables
--xxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- Membership Types
CREATE TABLE MembershipTypes (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50) UNIQUE NOT NULL
);

-- Staff Roles
CREATE TABLE StaffRoles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

-- Media Formats
CREATE TABLE MediaFormats (
    format_id INT PRIMARY KEY AUTO_INCREMENT,
    format_name VARCHAR(20) UNIQUE NOT NULL
);

-- Reservation Statuses
CREATE TABLE ReservationStatuses (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(20) UNIQUE NOT NULL
);

--xxxxxxxxxxxxxxxxxxxxxxxxxxxx
-- Core Tables
--xxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- Members
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    type_id INT NOT NULL,
    membership_date DATE NOT NULL,
    FOREIGN KEY (type_id) REFERENCES MembershipTypes(type_id)
);

CREATE INDEX idx_membership_type ON Members(type_id);

-- Staff
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    role_id INT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (role_id) REFERENCES StaffRoles(role_id)
);

CREATE INDEX idx_staff_role ON Staff(role_id);

-- Books
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    genre VARCHAR(100),
    published_year INT CHECK (published_year BETWEEN 1500 AND 2025),
    shelf_location VARCHAR(50),
    total_copies INT DEFAULT 1 CHECK (total_copies >= 0),
    available_copies INT DEFAULT 1 CHECK (available_copies >= 0)
);

CREATE INDEX idx_title ON Books(title);
CREATE INDEX idx_author ON Books(author);
CREATE INDEX idx_genre ON Books(genre);

-- Digital Media
CREATE TABLE DigitalMedia (
    media_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    format_id INT NOT NULL,
    access_url TEXT NOT NULL,
    license_type VARCHAR(100),
    uploaded_by INT,
    upload_date DATE NOT NULL,
    FOREIGN KEY (format_id) REFERENCES MediaFormats(format_id),
    FOREIGN KEY (uploaded_by) REFERENCES Staff(staff_id)
);

-- Archives
CREATE TABLE Archives (
    archive_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    date_archived DATE NOT NULL,
    archived_by INT,
    FOREIGN KEY (archived_by) REFERENCES Staff(staff_id)
);

-- Borrow Records
CREATE TABLE BorrowRecords (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE INDEX idx_due_date ON BorrowRecords(due_date);

-- Fines
CREATE TABLE Fines (
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    borrow_id INT NOT NULL,
    amount DECIMAL(6,2) NOT NULL CHECK (amount >= 0),
    paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (borrow_id) REFERENCES BorrowRecords(borrow_id)
);

-- Reservations
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    status_id INT NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (status_id) REFERENCES ReservationStatuses(status_id)
);

-- Events
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    event_date DATE NOT NULL,
    hosted_by INT NOT NULL,
    location VARCHAR(100),
    FOREIGN KEY (hosted_by) REFERENCES Staff(staff_id)
);

-- Event Registrations
CREATE TABLE EventRegistrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT NOT NULL,
    member_id INT NOT NULL,
    registration_date DATE NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
