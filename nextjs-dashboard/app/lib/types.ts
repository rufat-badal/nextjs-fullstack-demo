import { UUID } from 'crypto';
import { ColumnType, Generated } from 'kysely';

export type Month =
  | 'Jan'
  | 'Feb'
  | 'Mar'
  | 'Apr'
  | 'May'
  | 'Jun'
  | 'Jul'
  | 'Aug'
  | 'Sep'
  | 'Oct'
  | 'Nov'
  | 'Dec';

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
  date: ColumnType<Date, string, never>;
}

export interface CustomersTable {
  id: Generated<UUID>;
  name: string;
  email: string;
  image_url: string;
}

export interface RevenueTable {
  month: Month;
  revenue: number;
}
