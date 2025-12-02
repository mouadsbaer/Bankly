-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
-- 					FICHIER : query.sql						--
-- 			23 REQUÊTES SQL (Manipulation + Extraction)		--
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°



-- 1. Ajout d'un nouveau client :
INSERT INTO customer (customer_id, full_name, email, phone, registration_date)values (1, 'mouadsaber', 'mouadsaber@gmail.com', '21226589647', '2024-10-10');

-- 2. Modification du némuro du téléphone d’un customer:
update customer set phone = '21226359587' where customer_id = 1;

-- 3. Affichage de tous les costumers :
 select * from Customer;

-- 4. Affichage de full_name et email des customers :
select full_name, email from customer;

-- 5. Affichage dde tous les comptes :
select * from accounts;

-- 6. Affichage des account_numbers :
select account_number from accounts;

-- 7. Affichage de toutes les transactions :
select * from transactions;

-- 8. Affichage de tous les customers avec un balance > 10000 :
select * from accounts
where balance > 10000;

-- 9. Affichage des accounts avec un balance ≤ 0 :
select * from accounts
where balance <= 0;

-- 10. Affichage des transactions de type "debit" :
select * from transactions
where transaction_type = 'debit';

-- 11. Affichage des transactions de type "credit" :
 select * from transactions
where transaction_type = 'credit';

-- 12. Affichage des transactions du comptes qui le account_id = 1 :
select * from transactions
where account_id = 1;

-- 13. Affichage des customers ayant un account géré par l’advisor_id = 2 :
SELECT DISTINCT c.*
FROM customer c
JOIN accounts a ON c.customer_id = a.customer_id
WHERE a.advisor_id = 2;

-- 14. Affichage des comptes ayant account_type = "Savings"  :
select * from accounts
where account_type = "savings";

-- 15. Affichage des transactions avec un amount ≥ 500:
select * from transactions
where amount >= 500;

-- 16. Affichage des transactions avec un 100 <= amount <= 1000 :
select * from transactions
where amount > 100 and amount < 1000;

-- 17. Affichage de comptes du customer_id = 1:
select * from accounts
left join customer on accounts.customer_id = customer.customer_id
where accounts.customer_id = 1 ;

-- 18. Affichage des comptes triés par balance (ordre croissant):
select * from accounts
order by balance asc;

-- 19. Affichage des transactions triées par amount (ordre décroissant):
select * from transactions
order by amount desc;

-- 20. Affichage des 5 plus grandes transactions:
select * from transactions
order by amount asc limit 5;

-- 21. Affichage de toutes les transactions triées par transaction_date décroissante:
select * from transactions
order by transaction_date desc;

-- 22. Affichage des 3 dernières transactions:
select * from transactions
order by transaction_date desc limit 3;

-- 23. Affichage de chaque compte avec le nom du customer et le nom de l’advisor :
select a.*, c.full_name as client_nom, adv.full_name as adviseur_nom
from accounts a
join customer c on a.customer_id = c.customer_id
join advisor adv on a.advisor_id = adv.advisor_id;
