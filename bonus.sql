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

-- Le total du balance de tous les comptes de chaque client :
select c.customer_id, c.full_name , sum(a.balance) as total_balance
from customer c
join accounts a on c.customer_id = a.customer_id
group by c.customer_id, c.full_name
order by total_balance desc;

-- L'ajout d'une colonne created_at dans Accounts :
alter table accounts
add column created_at datetime;

