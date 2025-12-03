-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
-- 					FICHIER : query.sql						--
-- 			23 REQUÊTES SQL (Manipulation + Extraction)		--
-- °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°



												-- SECTION 1 : REQUÊTES DE MANIPULATION

-- 1. Ajout d'un nouveau client :
INSERT INTO customer (customer_id, full_name, email, phone, registration_date)values (1, 'mouadsaber', 'mouadsaber@gmail.com', '21226589647', '2024-10-10');

-- 2. Modification du némuro du téléphone d’un customer:
update customer set phone = '21226359587' where customer_id = 1;


												-- SECTION 2 : REQUÊTES D'EXTRACTION SIMPLES

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

