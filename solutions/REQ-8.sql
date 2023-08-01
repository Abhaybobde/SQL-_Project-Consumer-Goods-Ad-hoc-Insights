SELECT CASE
			WHEN MONTH(DATE) IN (9,10,11) THEN "Q1"
            WHEN MONTH(DATE) IN (12,1,2) THEN "Q2"
            WHEN MONTH(DATE) IN (3,4,5) THEN "Q3"
            ELSE "Q4"
            END AS QUARTERS,
		SUM(sold_quantity) as total_quantites_sold
from fact_sales_monthly
where fiscal_year = 2020
group by (QUARTERS)
ORDER BY total_quantites_sold DESC;