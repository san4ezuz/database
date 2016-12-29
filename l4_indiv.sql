--Вывести призывников, у которых было более одной отсрочки,
--одна из которых действующая

 SELECT pr_id,privatedata.fname,privatedata.surname,privatedata.name  from privatedata,prizyvnik
 where privatedata.pd_id=prizyvnik.privatedata_id AND
 prizyvnik.pr_id IN
 (SELECT prizyvnik.pr_id  from prizyvnik,storyprizyvnik
 where storyprizyvnik.pr_id = prizyvnik.pr_id AND storyprizyvnik.dateto< '26.12.2016'
 group by prizyvnik.pr_id
 having count(*)>1) ;
 
--Вывести количество призывников,
-- у которых была снижена группа здоровья после повторной медкомиссии.
 
CREATE VIEW medkomissiya AS                                                                                                                                                                                                                                                                                         
SELECT m1.pr_id, m1.group_id, m1.medical_date
from medicaldata as m1, medicaldata as m2
where m1.pr_id = m2.pr_id 
AND m1.medical_date > m2.medical_date
AND m1.group_id > m2.group_id  
order by m1.pr_id, m1.medical_date; 

SELECT COUNT(*) FROM medkomissiya;
 
--Вывести количество призывников по социальным статусам за заданный период 

SELECT socstname.statename, count(socstate.statess_id)  from status, socstate,socstname
where status.socst_id = socstate.socst_id  and statess_id = socstname_id and socstate.datefrom <= '01.01.2015' AND socstate.dateto >= '01.01.2016'
group by socstname.statename;
	
	
	