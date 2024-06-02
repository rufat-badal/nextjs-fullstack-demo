import { fetchRevenue } from "../lib/data";

export default async function Page() {
  const revenue = await fetchRevenue(); 

  // return <p>Dashboard Page</p>;
  return (
    <>
      <ul>
        {revenue.map((rev) => <li key={rev.month}>{rev.month}: {rev.revenue}</li>)}
      </ul>
    </>
  );
}
