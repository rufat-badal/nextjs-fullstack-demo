const fs = require('fs');

const seedDataFile = "./postgres/data.sql";

const uuidExtensionData = `CREATE EXTENSION IF NOT EXISTS "uuid-ossp"`;

const usersTableData = `CREATE TABLE IF NOT EXISTS users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);`;

const invoicesTableData = `CREATE TABLE IF NOT EXISTS invoices (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    customer_id UUID NOT NULL,
    amount INT NOT NULL,
    status VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);`;

const customersTableData = `CREATE TABLE IF NOT EXISTS customers (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    image_url VARCHAR(255) NOT NULL
);`;

function appendData(data) {
    fs.writeFileSync(seedDataFile, data + "\n", { flag: "a" });
}

function createFile() {
    fs.writeFileSync(seedDataFile, uuidExtensionData + "\n");
}

function createTables() {
    appendData("\n-- Tables");
    appendData(usersTableData);
    appendData(invoicesTableData);
    appendData(customersTableData);
}

function main() {
    createFile();
    createTables();
}

main();
