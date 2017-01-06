--Вывести призывников, у которых было более одной отсрочки,
--одна из которых действующая

 SELECT prizyvnik.pr_id,privatedata.fname,privatedata.name,privatedata.surname,storyprizyvnik.dateto from privatedata,prizyvnik,storyprizyvnik
 where privatedata.pd_id=prizyvnik.privatedata_id AND prizyvnik.pr_id=storyprizyvnik.pr_id AND
 prizyvnik.pr_id IN(SELECT prizyvnik.pr_id  from prizyvnik,storyprizyvnik
 where storyprizyvnik.pr_id = prizyvnik.pr_id 
 group by prizyvnik.pr_id
 having count(*)>1)
 and storyprizyvnik.dateto > (SELECT CAST('NOW' AS DATE) FROM rdb$database);

 
--Вывести количество призывников,
-- у которых была снижена группа здоровья после повторной медкомиссии.
 
CREATE VIEW medkomissiya1 AS                                                                                                                                                                                                                                                                                         
SELECT m2.pr_id, m2.group_id, m2.medical_date
from medicaldata as m1, medicaldata as m2
where m1.pr_id = m2.pr_id 
AND m1.medical_date < m2.medical_date
AND m1.group_id < m2.group_id  
order by m2.pr_id, m2.medical_date; 

SELECT COUNT(*) FROM medkomissiya1;
 
--Вывести количество призывников по социальным статусам за заданный период 

SELECT socstname.statename, count(socstate.statess_id)  from socstate,socstname
where statess_id = socstname_id
and((socstate.datefrom <= '01.01.2014' and socstate.dateto >= '01.01.2017')
or ( socstate.datefrom between  '01.01.2014' and '01.01.2017')
or ( socstate.dateto between  '01.01.2014' and '01.01.2017'))
group by socstname.statename;


