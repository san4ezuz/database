
SET TERM ^;
CREATE or alter PROCEDURE Count3 
RETURNS (otsrochki int , prizyvniki int)
AS
BEGIN
	FOR
	SELECT  count(storyprizyvnik.pr_id)as otsrochki,prizyvnik.pr_id from prizyvnik,storyprizyvnik,millitarydata
	where prizyvnik.pr_id=millitarydata.pr_id AND prizyvnik.pr_id=storyprizyvnik.pr_id 
	group by prizyvnik.pr_id
	order by otsrochki
	into :otsrochki, :prizyvniki
	do begin 
	SUSPEND;
	END
END^
SET TERM ;^

SET TERM ^;
CREATE or alter PROCEDURE storyCount
RETURNS (otsrochki int , otslujivshie int)
AS
BEGIN
	FOR
	SELECT  otsrochki,count(otsrochki) from count3
	group by otsrochki
	into :otsrochki, :otslujivshie
	do begin 
	SUSPEND;
	END
END^
SET TERM ;^
	
	