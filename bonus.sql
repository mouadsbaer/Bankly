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

-- Le total des montants debit et credit par account :

SELECT 
    a.account_id,
    c.full_name as client,
    a.account_type,
    COUNT(t.transaction_id) as nb_transactions,
    SUM(CASE WHEN t.transaction_type IN ('DEPOSIT', 'CREDIT') THEN t.amount ELSE 0 END) as total_credits,
    SUM(CASE WHEN t.transaction_type IN ('WITHDRAWAL', 'DEBIT') THEN t.amount ELSE 0 END) as total_debits,
    SUM(CASE 
        WHEN t.transaction_type IN ('DEPOSIT', 'CREDIT') THEN t.amount 
        ELSE -t.amount 
    END) as solde_net,
    a.balance as solde_actuel
FROM accounts a
JOIN customer c ON a.customer_id = c.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
GROUP BY a.account_id, c.full_name, a.account_type, a.balance
ORDER BY a.account_id;

-- 