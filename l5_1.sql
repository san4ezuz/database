
SET TERM ^;
CREATE or alter PROCEDURE Count1 (countYear int)
RETURNS ( cStatess_ID int, year1 int, SocCount int)
AS
	DECLARE VARIABLE tmpdat int;
	DECLARE VARIABLE today int;
	
BEGIN
	
	today = EXTRACT(YEAR FROM date 'TODAY');
	tmpdat = today - countYear;
	
	while (:tmpdat < :today) do begin
	FOR
	SELECT Statess_id, :tmpdat, COUNT(*)
		FROM socstate WHERE :tmpdat between EXTRACT(YEAR FROM datefrom)
		and EXTRACT(YEAR FROM dateto)
		GROUP BY Statess_ID,:tmpdat
		INTO cStatess_ID, year1, SocCount
	DO BEGIN
	SUSPEND;
	END
	tmpdat = :tmpdat + 1;
	END
END^
SET TERM ;^

SET TERM ^;
CREATE or alter PROCEDURE Count2 (countYear int)
RETURNS (socstname TYPE OF COLUMN socstname.statename , year1 int, SocCount int, raznica int)
AS
	DECLARE VARIABLE targetCountYear  int;
	DECLARE VARIABLE cStatess_ID int;
	DECLARE VARIABLE prevStatess_ID int;
	DECLARE VARIABLE prevCnt int;

	
BEGIN
	if(countYear IS NULL) then targetCountYear = '3';
	else targetCountYear = countYear;
	FOR
	select * from count1 (:countYear)
	order by cStatess_ID
	INTO cStatess_ID, year1, SocCount
	
	DO BEGIN 
	if((prevCnt IS NULL) OR (prevStatess_id IS NULL) OR (prevStatess_id<>cStatess_id))
	then begin raznica = 0; prevCnt = SocCount; prevStatess_ID = cStatess_ID; end
	else begin raznica = SocCount - prevCnt; prevCnt = SocCount; end
	SELECT statename FROM socstname WHERE socstname_ID = :cStatess_ID INTO socstname;
	SUSPEND;
	END
END^
SET TERM ;^
	