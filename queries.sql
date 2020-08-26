
-- Creating Database

createdb CompanyDatabase
pgcli CompanyDatabase

-- Creating Table Employees

CREATE TABLE "Employees" (
  "FullName"          VARCHAR(100) Not Null,
  "Salary"            DECIMAL(10,2),
  "JobPosition"       VARCHAR(100),
  "PhoneExtension"    VarChar(10),
  "IsPartTime"        BOOLEAN
  "ID"                SERIAL PRIMARY KEY       
);

-- Dummy Data. One entry is a cook. One entry is name Lazy Larry

INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lindsay Ledford', '32000', 'Project Manager', '2200','True' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Eric Poe', '32000', 'Junior DBA', '4400','False' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Joshua Mann', '112000', 'Lead Developer', '4900','False' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Daniel Labios', '105000', 'Product Designer', '6500','False' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Mohamed Amar', '232000', 'Chief Financial Officer', '9100','False' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Larry', '210000', 'Chief Executive Officer', '9200','False' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Gavin Stark', '225000', 'Chief Operations Officer', '9300','False' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Kento Kawakami', '32000', 'Front End Developer', '5200','True' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Byron Mcdaniel', '54000', 'Project Management Consultant', '2450','True' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Luke Safly', '75000', 'Cook', '7100','False' );

-- Show full name and phone extension for only part time workers

SELECT * FROM "Employees";
SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'False';

-- Add new part time software developer with salary 450

INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Bill Gates', '450', 'Software Developer', '4200','True' );

-- Change the Salary of Cooks to 500

UPDATE "Employees"
SET "Salary" = '500'
WHERE "JobPosition" = 'Cook';

-- Fire Lazy Larry

DELETE FROM "Employees"
WHERE "FullName" = 'Lazy Larry';

-- Add a new column under Employees called Parking Spot

ALTER TABLE "Employees"
ADD COLUMN "ParkingSpot" VarChar(10);