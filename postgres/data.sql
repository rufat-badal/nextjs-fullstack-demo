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
VALUES (410544b2-4001-4271-9855-fec4b6a6442a, User, user@nextmail.com, $2b$10$DWyQcV.5Z83DCo/V0Ppds.eUh2Sd6WTGu6V4.No6ovFhxXdppaOQi)
ON CONFLICT (id) DO NOTHING;
