const fs = require('fs');
const {
    invoices,
    customers,
    revenue,
    users,
} = require('./nextjs-dashboard/app/lib/placeholder-data.js');
const bcrypt = require('bcrypt');

const seedDataFile = "./postgres/data.sql";

const uuidExtensionData = `CREATE EXTENSION IF NOT EXISTS "uuid-ossp";`;

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

const revenueTableData = `CREATE TABLE IF NOT EXISTS revenue (
    month VARCHAR(4) NOT NULL UNIQUE,
    revenue INT NOT NULL
);`;

function appendData(data) {
    fs.writeFileSync(seedDataFile, data + "\n", { flag: "a" });
}

function createFile() {
    fs.writeFileSync(seedDataFile, uuidExtensionData + "\n");
}

function seedUsers() {
    appendData("\n-- Users Data");
    users.map((user) => {
        const hashedPassword = bcrypt.hashSync(user.password, 10);
        appendData(`INSERT INTO users (id, name, email, password)
VALUES ('${user.id}', '${user.name}', '${user.email}', '${hashedPassword}')
ON CONFLICT (id) DO NOTHING;`);
    });
}

function seedInvoices() {
    appendData("\n-- Invoices Data");
    invoices.map((invoice) => {
        appendData(`INSERT INTO invoices (customer_id, amount, status, date)
VALUES ('${invoice.customer_id}', ${invoice.amount}, '${invoice.status}', '${invoice.date}')
ON CONFLICT (id) DO NOTHING;`);
    });
}

function seedCustomers() {
    appendData("\n-- Customers Data");
    customers.map((customer) => {
        appendData(`INSERT INTO customers (id, name, email, image_url)
VALUES ('${customer.id}', '${customer.name}', '${customer.email}', '${customer.image_url}')
ON CONFLICT (id) DO NOTHING;`);
    });
}

function seedRevenue() {
    appendData("\n-- Revenue Data");
    revenue.map((rev) => {
        appendData(`INSERT INTO revenue (month, revenue)
VALUES ('${rev.month}', ${rev.revenue})
ON CONFLICT (month) DO NOTHING;`);
    });
}

function createTables() {
    appendData("\n-- Tables");
    appendData(usersTableData);
    appendData(invoicesTableData);
    appendData(customersTableData);
    appendData(revenueTableData);

    seedUsers();
    seedInvoices();
    seedCustomers();
    seedRevenue();
}

function main() {
    createFile();
    createTables();
}

main();
