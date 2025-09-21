--xxxxxxxxxxxxxxxxxxxxxxxxxxxx
-- Sample Queries for NationalLibrary Database
--xxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- 1. List all members with their membership type
SELECT m.name, m.email, mt.type_name
FROM Members m
JOIN MembershipTypes mt ON m.type_id = mt.type_id;

-- 2. Find books with fewer than 2 available copies
SELECT title, author, available_copies
FROM Books
WHERE available_copies < 2;

-- 3. Get overdue borrow records
SELECT br.borrow_id, m.name, b.title, br.due_date
FROM BorrowRecords br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL AND br.due_date < CURDATE();

-- 4. List unpaid fines with member and book details
SELECT f.fine_id, m.name, b.title, f.amount
FROM Fines f
JOIN BorrowRecords br ON f.borrow_id = br.borrow_id
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE f.paid = FALSE;

-- 5. Show all reservations with status
SELECT r.reservation_id, m.name, b.title, rs.status_name
FROM Reservations r
JOIN Members m ON r.member_id = m.member_id
JOIN Books b ON r.book_id = b.book_id
JOIN ReservationStatuses rs ON r.status_id = rs.status_id;

-- 6. List upcoming events with host info
SELECT e.title, e.event_date, s.name AS hosted_by, e.location
FROM Events e
JOIN Staff s ON e.hosted_by = s.staff_id
WHERE e.event_date >= CURDATE();

-- 7. Find digital media uploaded by a specific staff member
SELECT dm.title, mf.format_name, dm.access_url
FROM DigitalMedia dm
JOIN MediaFormats mf ON dm.format_id = mf.format_id
WHERE dm.uploaded_by = 3;

-- 8. Count of books per genre
SELECT genre, COUNT(*) AS total_books
FROM Books
GROUP BY genre;

-- 9. Total fines collected
SELECT SUM(amount) AS total_collected
FROM Fines
WHERE paid = TRUE;

-- 10. Most borrowed books
SELECT b.title, COUNT(*) AS borrow_count
FROM BorrowRecords br
JOIN Books b ON br.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC
LIMIT 5;

--xxxxxxxxxxxxxxxxxxxxxxxxxxxx
-- Advanced Queries Using LEFT JOIN and RIGHT JOIN
--xxxxxxxxxxxxxxxxxxxxxxxxxxxx

-- 11. Members who haven’t borrowed any books
SELECT m.name, br.borrow_id
FROM Members m
LEFT JOIN BorrowRecords br ON m.member_id = br.member_id
WHERE br.borrow_id IS NULL;

-- 12. Books that have never been reserved
SELECT b.title, r.reservation_id
FROM Books b
LEFT JOIN Reservations r ON b.book_id = r.book_id
WHERE r.reservation_id IS NULL;

-- 13. Staff who haven’t uploaded any digital media
SELECT s.name, dm.media_id
FROM Staff s
LEFT JOIN DigitalMedia dm ON s.staff_id = dm.uploaded_by
WHERE dm.media_id IS NULL;

-- 14. All reservation statuses, even if unused
SELECT rs.status_name, r.reservation_id
FROM ReservationStatuses rs
LEFT JOIN Reservations r ON rs.status_id = r.status_id;

-- 15. Members who haven’t registered for any events
SELECT m.name, er.registration_id
FROM Members m
LEFT JOIN EventRegistrations er ON m.member_id = er.member_id
WHERE er.registration_id IS NULL;

-- 16. Events with no registrations
SELECT e.title, er.registration_id
FROM Events e
LEFT JOIN EventRegistrations er ON e.event_id = er.event_id
WHERE er.registration_id IS NULL;

-- 17. Books that have never been borrowed
SELECT b.title, br.borrow_id
FROM Books b
LEFT JOIN BorrowRecords br ON b.book_id = br.book_id
WHERE br.borrow_id IS NULL;

-- 18. Staff roles with no assigned staff
SELECT sr.role_name, s.staff_id
FROM StaffRoles sr
LEFT JOIN Staff s ON sr.role_id = s.role_id
WHERE s.staff_id IS NULL;

-- 19. Membership types with no members
SELECT mt.type_name, m.member_id
FROM MembershipTypes mt
LEFT JOIN Members m ON mt.type_id = m.type_id
WHERE m.member_id IS NULL;

-- 20. Media formats with no digital media
SELECT mf.format_name, dm.media_id
FROM MediaFormats mf
LEFT JOIN DigitalMedia dm ON mf.format_id = dm.format_id
WHERE dm.media_id IS NULL;
