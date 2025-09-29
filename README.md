SQL Window Functions – Gadget Sales Project
Business Context

My business is about selling phones, laptops, and cameras in Rwanda. The stores operate in different provinces like Kigali, Southern, Northern, Western, and Eastern. The main goal of this project is to understand how products are performing in different regions, how customers behave, and how sales are changing over time.

Data Challenges

Even though the company records a lot of transaction data, it is not easy for managers to directly see:

which products are the best sellers in each region,

which customers are the most loyal,

and how sales grow or drop month by month.

Expected Outcomes

The analysis should help to:

Find the top products in every region and quarter.

Track cumulative monthly revenue.

Show how sales are changing month over month.

Group customers into quartiles to measure loyalty.

Use moving averages to forecast demand and smooth trends.

Success Criteria

To achieve this, I used 5 different window functions:

Top 5 products per region/quarter → RANK()

Running monthly sales totals → SUM() OVER()

Month-over-month growth → LAG()

Customer quartiles (loyalty segmentation) → NTILE(4)

3-month moving averages → AVG() OVER()

Database Schema

I used Oracle DBMS with 3 tables:

customers (customer_id, name, region)

tech_gadgets (product_id, name, category)

transactions (transaction_id, customer_id, product_id, sale_date, amount)

Customers and products are linked through transactions.

Window Function Queries

Ranking (Top 5 products per region/quarter)
This query finds which products earn the most revenue in each province and quarter.

Aggregate (Running monthly revenue total)
This shows revenue per month and a running total that keeps adding up month by month.

Navigation (Month-over-month growth)
This compares the number of sales in one month with the previous month and calculates the percentage increase or decrease.

Distribution (Customer quartiles)
This groups customers into 4 quartiles based on how many purchases they made. Quartile 1 are the most active buyers.

Moving Average (3-month rolling sales)
This calculates the average sales over 3 months to smooth out spikes and dips.

Interpretation of Results

The ranking query helped me identify the best-selling products by region. Phones usually came up as the top product compared to laptops and cameras.

The aggregate and moving average queries showed sales trends, especially growth during certain months like December.

The navigation query made it clear when sales dropped after strong months.

The distribution query showed that a small group of customers contribute to a big portion of sales.

Insights

Descriptive (What happened?)

Phones had the highest demand across regions.

December and holiday months showed sales peaks.

A small set of loyal customers buy regularly.

Diagnostic (Why?)

Phones are essential and have the largest market demand.

Seasonal promotions and holidays explain sales peaks.

Loyalty differences depend on how often customers upgrade gadgets.

Prescriptive (What Next?)

Stock more phones during peak periods.

Create promotions for laptops and cameras to increase their sales.

Give discounts to loyal customers and create offers for new or occasional buyers.

REFERENCES

Freecodecamp ( https://www.freecodecamp.org/news/window-functions-in-sql/?utm_source=chatgpt.com )
geeksforgeeks ( https://www.geeksforgeeks.org/sql/window-functions-in-sql/?utm_source=chatgpt.com )
LearnSQL.com ( https://learnsql.com/blog/sql-window-functions-examples/?utm_source=chatgpt.com )
MySql Documentation ( https://dev.mysql.com/doc/refman/8.1/en/window-functions-usage.html?utm_source=chatgpt.com )
Mode Analytics ( https://mode.com/sql-tutorial/sql-window-functions/?utm_source=chatgpt.com )
W3schools ( https://www.w3schools.com/sql/sql_window_functions.asp )
Data school ( https://www.youtube.com/watch?v=8vTX2z3IOFQ )
TechontheNet ( https://www.youtube.com/watch?v=Jh6Xv5l6Pp0 )
Move Share by Volkswagen, Move Rwanda ( https://move.rw/?utm_source=chatgpt.com )
Oracle corporation ( https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/Window-Functions.html )
