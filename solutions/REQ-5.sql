SELECT a.product_code as product_code,
	a.product as product,
    CONCAT('$',ROUND(b.manufacturing_cost,2)) AS manufacturing_cost
from dim_product as a 
inner join fact_manufacturing_cost as  b
on a.product_code = b.product_code
where b.manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost)
or b.manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost)
order by b.manufacturing_cost desc;