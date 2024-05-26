CREATE EXTENSION IF NOT EXISTS "uuid-ossp"

-- Tables
CREATE TABLE IF NOT EXISTS users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS invoices (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    customer_id UUID NOT NULL,
    amount INT NOT NULL,
    status VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);
CREATE TABLE IF NOT EXISTS customers (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    image_url VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS revenue (
    month VARCHAR(4) NOT NULL UNIQUE,
    revenue INT NOT NULL
);

-- Users Data
INSERT INTO users (id, name, email, password)
VALUES (410544b2-4001-4271-9855-fec4b6a6442a, User, user@nextmail.com, $2b$10$XA91.0woFZ/rLmkOpZEP4O2h5RN3NO4B/vnPjOhBJCEY/drynWB5q)
ON CONFLICT (id) DO NOTHING;

-- Invoices Data
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (3958dc9e-712f-4377-85e9-fec4b6a6442a, 15795, pending, 2022-12-06)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (3958dc9e-742f-4377-85e9-fec4b6a6442a, 20348, pending, 2022-11-14)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (3958dc9e-787f-4377-85e9-fec4b6a6442a, 3040, paid, 2022-10-29)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (50ca3e18-62cd-11ee-8c99-0242ac120002, 44800, paid, 2023-09-10)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (76d65c26-f784-44a2-ac19-586678f7c2f2, 34577, pending, 2023-08-05)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (126eed9c-c90c-4ef6-a4a8-fcf7408d3c66, 54246, pending, 2023-07-16)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (d6e15727-9fe1-4961-8c5b-ea44a9bd81aa, 666, pending, 2023-06-27)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (50ca3e18-62cd-11ee-8c99-0242ac120002, 32545, paid, 2023-06-09)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (3958dc9e-787f-4377-85e9-fec4b6a6442a, 1250, paid, 2023-06-17)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (76d65c26-f784-44a2-ac19-586678f7c2f2, 8546, paid, 2023-06-07)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (3958dc9e-742f-4377-85e9-fec4b6a6442a, 500, paid, 2023-08-19)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (76d65c26-f784-44a2-ac19-586678f7c2f2, 8945, paid, 2023-06-03)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (3958dc9e-737f-4377-85e9-fec4b6a6442a, 8945, paid, 2023-06-18)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (3958dc9e-712f-4377-85e9-fec4b6a6442a, 8945, paid, 2023-10-04)
ON CONFLICT (id) DO NOTHING;
INSERT INTO invoices (customer_id, amount, status, date)
VALUES (3958dc9e-737f-4377-85e9-fec4b6a6442a, 1000, paid, 2022-06-05)
ON CONFLICT (id) DO NOTHING;
