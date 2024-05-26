const fs = require('fs');

const seedDataFile = "./postgres/data.sql";

const uuidExtensionData = `CREATE EXTENSION IF NOT EXISTS "uuid-ossp"`;

const usersTableData = `CREATE TABLE IF NOT EXISTS users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);`;

function appendData(data) {
    fs.writeFileSync(seedDataFile, data + "\n", { flag: "a" });
}

function createFile() {
    fs.writeFileSync(seedDataFile, uuidExtensionData + "\n");
}

function main() {
    createFile();
    appendData("\n" + usersTableData);
}

main();
