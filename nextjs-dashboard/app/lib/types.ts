export interface Database {
  users: UsersTable;
  invoices: InvoicesTable;
  customers: CustomersTable;
  revenue: RevenueTable;
}

export interface UsersTable {}

export interface InvoicesTable {}

export interface CustomersTable {}

export interface RevenueTable {}
