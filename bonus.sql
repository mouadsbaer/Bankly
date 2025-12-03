-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
-- 					FICHIER : bonus.sql						--
-- 							BONUS							--
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

-- Le nombre de transactions par compte :
 select a.account_id , c.full_name as client, count(t.transaction_id) as nbr_transactions
from accounts a
join customer c on a.customer_id = c.customer_id
left join transactions t on a.account_id = t.account_id
group by a.account_id, c.full_name, a.account_type
order by account_id;


-- 