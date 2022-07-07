-- Oggi continuiamo con l’esercitazione su DB University.
-- Usate la stessa repo db-university-query e aggiungete un nuovo file .sql contenente le seguenti query:
-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
-- Selezionare tutti i corsi in cui insegna Fulvio Amato
-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
-- Contare quanti corsi di laurea ci sono per ogni dipartimento e mostrare nome dipartimento e numero di corsi

-- 1 Contare quanti iscritti ci sono stati ogni anno (la data di iscrizione sulla tabella students è enrolment_date)

-- selezione dalle date di iscrizione
SELECT  COUNT(*), YEAR (enrolment_date) 
-- nella tab studenti
FROM students s 
-- raggruppa gli studenti per anno 
GROUP BY YEAR (enrolment_date)
-- ordina le date
ORDER BY YEAR(enrolment_date);




-- esempio di francesco
SELECT *
FROM students s -- dalla tabella studenti che rinomino s 
JOIN `degrees`d ON s.degree_id = d.id -- dalla tabella degree prendi id degli studenti collegati al id degree
WHERE s.id 
ORDER BY YEAR(enrolment_date);


-- 2 Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

-- prendi da tab studenti
SELECT s.degree_id , s.name , s.surname  FROM students s 
-- prendi dalla tabella degrees la riga dove l'id di studente  corrisponde all'id del corso 
JOIN `degrees`d ON s.degree_id = d.id 
-- dove il corso si chiama 'corso di laurea in economia'
WHERE d.name = 'Corso di Laurea in Economia';





-- 3 Selezionare tutti i corsi in cui insegna Fulvio Amato
-- seleziono le colonne
SELECT t.name , t.surname , c.name 
-- poi dalla tabella corso
FROM courses c 
INNER JOIN course_teacher ct ON ct.course_id = c.id 
INNER JOIN teachers t ON ct.teacher_id = t.id 
WHERE t.name ='Fulvio' AND t.surname ='Amato';



-- 4 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT s.name , s.surname , s.registration_number , d2.name 
-- da studente
FROM students s 
-- collego studente a corso
INNER JOIN `degrees`d ON s.degree_id = d.id 
-- collego studente con il corso al dipartimento
INNER JOIN departments d2 ON d.department_id = d2.id 
-- ordino per nome e cognome
ORDER BY s.name , s.surname ;


-- 5 Contare quanti corsi di laurea ci sono per ogni dipartimento e mostrare nome dipartimento e numero di corsi
SELECT COUNT(d.id) as cdl_dipartimento, dep.name FROM `degrees` d
 INNER JOIN departments dep
 ON d.department_id = dep.id
 GROUP BY d.department_id ;





