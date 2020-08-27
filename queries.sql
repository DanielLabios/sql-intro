
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

-- Select All Columns for all Employees

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

-- Create new table Departments

CREATE TABLE "Departments" (
  "Id"         SERIAL PRIMARY KEY NOT NULL,
  "DepartmentName"    text,
  "Building"          text    
);

-- Add department Id to Employees table

ALTER TABLE "Employees"
ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");

-- Create new table Products

CREATE TABLE "Products" (
  "Id"         SERIAL PRIMARY KEY NOT NULL,
  "Price"             DECIMAL(10,2),
  "Name"              VARCHAR(100),
  "Description"       VARCHAR(500),
  "QuantityInStock"   INTEGER        
);

-- Create new Table Orders

CREATE TABLE "Orders" (
  "Id"         SERIAL PRIMARY KEY NOT NULL,
  "OrderNumber"       VARCHAR(50),
  "DatePlaced"        TIMESTAMP,
  "Email"             VARCHAR(100)
);

-- ProductOrders Handles Many to Many Relationship

CREATE TABLE "ProductOrders" (
  "Id"         SERIAL PRIMARY KEY NOT NULL,
  "ProductId"         INTEGER REFERENCES "Products" ("Id"),
  "OrderId"           INTEGER REFERENCES "Orders" ("Id"),
  "OrderQuantity"     INTEGER
);

-- Inserting Departments Entries

INSERT INTO "Departments"("DepartmentName", "Building")
VALUES ('Development', 'Main' );
INSERT INTO "Departments"("DepartmentName", "Building")
VALUES ('Marketing', 'North' );

-- Insert More Employees

INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tim Smith', '40000', 'Programmer', '123','False', '1' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Barbara Ramsey', '80000', 'Manager', '234','False', '1' );
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tom Jones', '32000', 'Admin', '456','True', '2' );

--Insert Products

INSERT INTO "Products"("Price", "Name", "Description", "QuantityInStock")
VALUES ('12.45', 'Widget', 'The Original Widget', '100' );
INSERT INTO "Products"("Price", "Name", "Description", "QuantityInStock")
VALUES ('99.99', 'Flowbee', 'Perfect for haircuts', '3' );

-- Insert Order x529

INSERT INTO "Orders"("OrderNumber", "DatePlaced", "Email")
VALUES ('X529', '2020-01-01 16:55:00', 'person@example.com');

-- Adding Orders for x529

INSERT INTO "ProductOrders"("ProductId", "OrderId", "OrderQuantity")
VALUES ('1','1','3');
INSERT INTO "ProductOrders"("ProductId", "OrderId", "OrderQuantity")
VALUES ('2','1','2');

--  Given a department id, return all employees in the department.

SELECT * FROM "Employees" WHERE "DepartmentId" = '1';

-- Given department name, return all the phone extensions

SELECT "Employees"."FullName", "Employees"."PhoneExtension", "Departments"."DepartmentName"
FROM "Employees"
JOIN "Departments" ON "Departments"."Id" = "Employees"."DepartmentId"
WHERE "Departments"."DepartmentName" = 'Development';

-- Find all orders that contain product id 2

SELECT "Orders".*, "Products"."Id", "Products"."Name"
FROM "Orders"
JOIN "ProductOrders" ON "Orders"."Id" = "ProductOrders"."OrderId"
JOIN "Products" ON "Products"."Id" = "ProductOrders"."ProductId"
WHERE "Products"."Id" = '2';



-- Delete Flowbee from Product order x529

DELETE
FROM "ProductOrders"
WHERE "ProductId" = '2';