	SET TERM ^;
	Create procedure insert_value ( name_rank VARCHAR (50))
	as
	begin
		INSERT INTO Ranks  VALUES ( :name_rank );
	end
	 ^
	 SET TERM ; ^
	 
	Create procedure update_milli(action INT)
	as begin
	UPDATE millitarydata 
	SET action = 2
	WHERE action < 2;
	END
	^
	
	Create procedure del_unused
	as begin
	DELETE FROM relship 
	WHERE relship.relship_id NOT IN (SELECT privatedata.relship_id FROM privatedata,relship
	WHERE privatedata.relship_id=relship.relship_id);
	END
	^