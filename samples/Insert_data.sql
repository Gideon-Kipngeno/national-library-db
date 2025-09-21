--xxxxxxxxxxxxxxxxxxxxxxxxxxxx
-- Reference Table Data (MUST BE FIRST)
--xxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- Insert reference data
INSERT INTO MembershipTypes (type_name) VALUES
('Regular'),
('Premium'),
('Student'),
('Senior'),
('Staff'),
('Family'),
('VIP'),
('Corporate'),
('Guest'),
('Library Assistant');


INSERT INTO StaffRoles (role_name) VALUES
('Librarian'),
('Assistant Librarian'),
('Library Director'),
('IT Support'),
('Custodian'),
('Security'),
('Event Manager'),
('Marketing'),
('Clerk'),
('Customer Service');


INSERT INTO MediaFormats (format_name) VALUES
('PDF'),
('ePub'),
('MP3'),
('MP4'),
('AVI'),
('JPEG'),
('PNG'),
('MOBI'),
('HTML'),
('Text');

INSERT INTO ReservationStatuses (status_name) VALUES
('Pending'),
('Confirmed'),
('Cancelled'),
('Completed'),
('Overdue'),
('Returned'),
('Cancelled by Staff'),
('Pending Approval'),
('Archived'),
('Active');

--xxxxxxxxxxxxxxxxxxxxxxxxxxxx
-- Core Table Data
--xxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- Staff (must come after StaffRoles)
INSERT INTO Members (name, email, phone, type_id, membership_date) VALUES
('John Doe', 'johndoe@example.com', '123-456-7890', 1, '2023-01-15'),
('Jane Smith', 'janesmith@example.com', '234-567-8901', 2, '2022-03-22'),
('Mary Johnson', 'mary.johnson@example.com', '345-678-9012', 3, '2021-07-30'),
('James Brown', 'james.brown@example.com', '456-789-0123', 4, '2023-06-11'),
('Emily Davis', 'emily.davis@example.com', '567-890-1234', 1, '2020-02-17'),
('Michael Wilson', 'michael.wilson@example.com', '678-901-2345', 5, '2022-10-05'),
('Sarah Lee', 'sarah.lee@example.com', '789-012-3456', 6, '2023-03-09'),
('David Harris', 'david.harris@example.com', '890-123-4567', 7, '2021-12-25'),
('Jessica Clark', 'jessica.clark@example.com', '901-234-5678', 8, '2024-01-01'),
('Chris Walker', 'chris.walker@example.com', '012-345-6789', 9, '2022-08-13');

-- Members (must come after MembershipTypes)
INSERT INTO Staff (name, role_id, email, hire_date) VALUES
('Alice Williams', 1, 'alice.williams@library.com', '2019-05-17'),
('Bob Taylor', 2, 'bob.taylor@library.com', '2021-02-23'),
('Carol Martinez', 3, 'carol.martinez@library.com', '2020-07-10'),
('David Wilson', 4, 'david.wilson@library.com', '2018-11-12'),
('Eva Thompson', 5, 'eva.thompson@library.com', '2023-03-19'),
('Frank Moore', 6, 'frank.moore@library.com', '2022-09-08'),
('Grace Taylor', 7, 'grace.taylor@library.com', '2021-10-04'),
('Helen Lewis', 8, 'helen.lewis@library.com', '2020-02-14'),
('Ian Davis', 9, 'ian.davis@library.com', '2023-05-06'),
('Jack Harris', 10, 'jack.harris@library.com', '2019-09-21');

-- Books (no foreign key dependencies) 
INSERT INTO Books (title, author, isbn, genre, published_year, shelf_location, total_copies, available_copies) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 'Fiction', 1925, 'A1', 5, 3),
('To Kill a Mockingbird', 'Harper Lee', '9780061120084', 'Fiction', 1960, 'A2', 4, 2),
('1984', 'George Orwell', '9780451524935', 'Dystopian', 1949, 'B1', 6, 5),
('Pride and Prejudice', 'Jane Austen', '9780141439518', 'Romance', 1813, 'C1', 3, 1),
('Moby Dick', 'Herman Melville', '9781851244422', 'Adventure', 1851, 'D2', 7, 4),
('The Catcher in the Rye', 'J.D. Salinger', '9780316769488', 'Fiction', 1951, 'E3', 4, 4),
('War and Peace', 'Leo Tolstoy', '9780307266934', 'Historical Fiction', 1869, 'F1', 2, 1),
('The Hobbit', 'J.R.R. Tolkien', '9780261103344', 'Fantasy', 1937, 'G2', 6, 6),
('Brave New World', 'Aldous Huxley', '9780060850524', 'Dystopian', 1932, 'H1', 8, 5),
('The Odyssey', 'Homer', '9780140268867', 'Classics', 1954, 'I1', 3, 2);

-- DigitalMedia (must come after Staff and MediaFormats)
INSERT INTO DigitalMedia (title, format_id, access_url, license_type, uploaded_by, upload_date) VALUES
('Digital Photography 101', 6, 'https://library.com/digitalphotography101', 'Creative Commons', 1, '2023-07-11'),
('Machine Learning Basics', 8, 'https://library.com/machinelearningbasics', 'Public Domain', 2, '2022-09-14'),
('Cooking for Beginners', 7, 'https://library.com/cookingforbeginners', 'Paid License', 3, '2021-05-19'),
('Python Programming', 9, 'https://library.com/pythonprogramming', 'Free License', 4, '2020-12-02'),
('Introduction to Art', 6, 'https://library.com/introductiontoart', 'Creative Commons', 5, '2024-02-25'),
('Climate Change Awareness', 7, 'https://library.com/climatechangeawareness', 'Paid License', 6, '2023-01-10'),
('Astronomy for Kids', 9, 'https://library.com/astronomyforkids', 'Public Domain', 7, '2023-04-20'),
('Digital Marketing Guide', 8, 'https://library.com/digitalmarketingguide', 'Paid License', 8, '2022-08-16'),
('AI in Healthcare', 7, 'https://library.com/aihealthcare', 'Free License', 9, '2021-11-01'),
('The History of Rome', 6, 'https://library.com/historyofrome', 'Creative Commons', 10, '2024-06-22');

-- Archives (must come after Staff)
INSERT INTO Archives (title, description, date_archived, archived_by) VALUES
('Historical Newspaper Articles', 'A collection of historical newspaper articles from the early 1900s.', '2023-01-14', 2),
('Old Maps of Europe', 'Maps from the 16th to 19th century, covering various European countries.', '2021-07-12', 3),
('Photographs from the Civil War', 'A collection of photographs documenting the American Civil War.', '2020-06-23', 1),
('Ancient Manuscripts', 'Manuscripts dating back to the 14th century.', '2022-11-05', 4),
('Letters from World War II', 'Personal letters written during World War II.', '2023-04-19', 5),
('Royal Documents', 'Official documents from various European monarchies.', '2024-02-11', 6),
('Diaries of Famous Explorers', 'A collection of diaries written by famous explorers.', '2021-09-09', 7),
('Ancient Egyptian Artifacts', 'Photographs and descriptions of ancient Egyptian artifacts.', '2022-10-28', 8),
('Renaissance Art Collection', 'A collection of works from the Renaissance period.', '2023-12-03', 9),
('Victorian Era Postcards', 'Postcards from the Victorian era, featuring various landmarks.', '2020-08-21', 10);

-- BorrowRecords (must come after Members and Books)
INSERT INTO BorrowRecords (member_id, book_id, borrow_date, due_date, return_date) VALUES
(1, 11, '2023-01-10', '2023-02-10', '2023-02-05'),  
(2, 12, '2023-03-15', '2023-04-15', '2023-04-10'),  
(3, 13, '2023-05-01', '2023-06-01', NULL),         
(4, 14, '2023-07-20', '2023-08-20', '2023-08-18'),  
(5, 15, '2023-09-10', '2023-10-10', NULL),          
(6, 16, '2023-02-05', '2023-03-05', '2023-03-04'),  
(7, 17, '2023-04-12', '2023-05-12', NULL),          
(8, 18, '2023-06-22', '2023-07-22', '2023-07-20'),  
(9, 19, '2023-08-30', '2023-09-30', NULL),         
(10, 20, '2023-10-15', '2023-11-15', '2023-11-10'); 

-- Fines (must come after BorrowRecords)
INSERT INTO Fines (borrow_id, amount, paid) VALUES
(43, 5.00, FALSE),
(44, 3.50, TRUE),
(45, 2.00, FALSE),
(46, 4.00, TRUE),
(47, 1.00, FALSE),
(48, 0.50, TRUE),
(49, 6.00, FALSE),
(50, 2.50, TRUE),
(51, 7.00, FALSE),
(52, 3.00, TRUE);

-- Reservations (must come after Members, Books, and ReservationStatuses)
INSERT INTO Reservations (member_id, book_id, reservation_date, status_id) VALUES
(1, 11, '2023-01-05', 2),
(2, 12, '2022-07-20', 3),
(3, 13, '2022-10-15', 4),
(4, 14, '2023-05-10', 5),
(5, 15, '2021-09-01', 1),
(6, 16, '2022-06-01', 2),
(7, 17, '2023-03-01', 3),
(8, 18, '2020-10-05', 4),
(9, 19, '2022-05-01', 5),
(10, 20, '2023-02-01', 1);



-- Events (must come after Staff)
INSERT INTO Events (title, description, event_date, hosted_by, location) VALUES
('Book Fair', 'A fair showcasing new books and authors.', '2023-05-25', 2, 'Library Hall'),
('Writing Workshop', 'Workshop on creative writing techniques.', '2022-07-10', 3, 'Room 201'),
('History Seminar', 'A seminar discussing world history.', '2021-11-20', 4, 'Room 101'),
('Art Exhibition', 'An exhibition showcasing local artists.', '2024-02-15', 5, 'Art Gallery'),
('Science Fair', 'A science fair for young students.', '2023-03-30', 6, 'Science Building'),
('Technology Conference', 'Conference about the future of technology.', '2022-09-12', 7, 'Main Auditorium'),
('Poetry Reading', 'A poetry reading event.', '2020-06-18', 8, 'Room 305'),
('Library Fundraiser', 'A fundraiser to support the library.', '2023-12-05', 9, 'Outdoor Courtyard'),
('Digital Literacy Class', 'Class on improving digital skills.', '2023-01-20', 10, 'Computer Lab'),
('Film Screening', 'Screening of classic films.', '2023-07-11', 1, 'Room 402');


-- EventRegistrations (must come after Events and Members)
INSERT INTO EventRegistrations (event_id, member_id, registration_date) VALUES
(1, 1, '2023-05-20'),
(2, 2, '2022-07-05'),
(3, 3, '2022-10-10'),
(4, 4, '2023-02-15'),
(5, 5, '2021-09-10'),
(6, 6, '2022-06-25'),
(7, 7, '2020-05-05'),
(8, 8, '2023-12-01'),
(9, 9, '2023-01-18'),
(10, 10, '2023-07-09');