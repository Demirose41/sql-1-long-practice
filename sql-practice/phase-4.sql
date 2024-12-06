DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS relationships;
DROP TABLE IF EXISTS performance_reviews;
DROP TABLE IF EXISTS office_parties;

CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    department VARCHAR(255),
    roles VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS relationships (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    p_one VARCHAR(255) NOT NULL,
    p_two VARCHAR(255) NOT NULL,
    FOREIGN KEY (p_one) REFERENCES employees(first_name),
    FOREIGN KEY (p_two) REFERENCES employees(first_name)
);

CREATE TABLE IF NOT EXISTS performance_reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee VARCHAR(255),
    score DECIMAL(4,2)
);

CREATE TABLE IF NOT EXISTS office_parties (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    budget DECIMAL(10,2),
    onsite BOOLEAN
);

-- 1-7 Bulk Add Employees
INSERT INTO employees (first_name, last_name, department, roles) 
VALUES
    ('Michael', 'Scott', 'Management', 'Regional Manager'),
    ('Dwight', 'Schrute', 'Sales', 'Assistant Regional Manager'),
    ('Jim', 'Halpert', 'Sales', 'Sales Representative'),
    ('Pam', 'Beesly', 'Reception', 'Receptionist'),
    ('Kelly', 'Kapoor', 'Product Oversight', 'Customer Service Representative'),
    ('Angela', 'Martin', 'Accounting', 'Head of Accounting'),
    ('Roy', 'Anderson', 'Warehouse', 'Warehouse Staff');

-- 8. Set Relationship

INSERT INTO relationships (p_one, p_two) VALUES ('Pam', 'Roy');

-- 9 Ryan joins the firm
INSERT INTO employees (first_name, last_name, department, roles)
VALUES ('Ryan', 'Howard', 'Reception', 'Temp');

-- 10.
INSERT INTO office_parties(budget, onsite) VALUES (100.00, 'true');

-- 11. 
INSERT INTO performance_reviews(employee, score) 
VALUES 
('Dwight', 3.3),
('Jim', 4.2);

UPDATE performance_reviews
SET score = 9.0
WHERE employee = 'Dwight';

UPDATE performance_reviews
SET score = 9.3
WHERE employee = 'Jim';

UPDATE employees
SET roles = 'Assistant Regional Manager'
WHERE first_name = 'Jim';

UPDATE employees
SET 
roles = 'Sales Representative',
department = 'Sales'
WHERE first_name = 'Ryan';

INSERT INTO office_parties (budget, onsite) VALUES (200.00, 'true');

INSERT INTO relationships (p_one, p_two) VALUES ('Dwight','Angela');

INSERT INTO performance_reviews (employee, score) VALUES ('Angela', 6.2);

INSERT INTO relationships (p_one, p_two) VALUES ('Ryan', 'Kelly');

Insert INTO office_parties (budget, onsite) VALUES (50.00, 'true');

DELETE FROM relationships WHERE p_one = 'Jim' OR p_two = 'Jim';
DELETE FROM performance_reviews WHERE employee = 'Jim';

DELETE FROM relationships WHERE p_one = 'Pam' OR p_two = 'Pam';

INSERT INTO performance_reviews (employee, score) VALUES ('Pam', 7.6);

-- "Dwight Schrute" gets another performance review score of 8.7.
INSERT INTO performance_reviews (employee, score) VALUES ('Dwight', 8.7);
-- "Ryan Howard" quits the office (make sure to remove his relationships and performance reviews if he has any).
DELETE FROM relationships WHERE p_one = 'Ryan' OR p_two = 'Ryan';
DELETE FROM performance_reviews WHERE employee = 'Ryan';    
-- "Jim Halpert" moves back to this office branch's "Sales" department in the role of "Sales Representative"
INSERT INTO employees (first_name, last_name, department, roles) 
VALUES ('Jim', 'Halpert', 'Sales', 'Sales Representative')
-- "Karen Filippelli" moves from a different office into this office's "Sales" department in the role of "Sales Representative"
INSERT INTO employees (first_name, last_name, department, roles) 
VALUES ('Karen', 'Filippelli', 'Sales', 'Sales Representative')
-- "Karen Filippelli" and "Jim Halpert" are in a romantic relationship.
INSERT INTO relationships (p_one, p_two) VALUES ('Karen', 'Jim');
-- An onsite office party is scheduled with a budget of $120.00.
Insert INTO office_parties (budget, onsite) VALUES (120.00, 'true');
-- The onsite office party scheduled right before this is canceled, and an offsite office party is scheduled instead with a budget of $300.00.
DELETE FROM office_parties WHERE budget = 50;
-- "Karen Filippelli" and "Jim Halpert" are NO LONGER in a romantic relationship.
DELETE FROM relationships WHERE p_one = 'Karen' OR p_two = 'Karen';
-- "Pam Beesly" and "Jim Halpert" are in a romantic relationship.
INSERT INTO relationships (p_one, p_two) VALUES ('Jim','Pam');



SELECT * FROM employees;
SELECT * FROM office_parties;
SELECT * FROM relationships;
SELECT * FROM performance_reviews;
