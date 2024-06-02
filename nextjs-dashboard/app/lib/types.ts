import { Generated } from 'kysely';

type UUID = `${string}-${string}-${string}-${string}-${string}`;

export interface Database {
  users: UsersTable;
  invoices: InvoicesTable;
  customers: CustomersTable;
  revenue: RevenueTable;
}

export interface UsersTable {
  id: Generated<UUID>;
  name: string;
  email: string;
  password: string;
}

export interface InvoicesTable {
  id: Generated<UUID>;
  customer_id: UUID;
  amount: number;
  status: 'pending' | 'paid';
  date: `${number}-${number}-${number}`;
}

export interface CustomersTable {
  id: Generated<UUID>;
  name: string;
  email: string;
  image_url: string;
}

export interface RevenueTable {
  month: string;
  revenue: number;
}
