CREATE OR REPLACE FUNCTION public.changeme()
 RETURNS void
 LANGUAGE plpgsql
AS $function$

<<block>>

DECLARE

	total_esx int := 3;
	username varchar  := 'management';
	password varchar := 'ac11b0c9bd5e82ff7eba633845eaf9865fdf1b7b9cafd013';
--	status varchar :='OK';

BEGIN

--	FOR esx  IN 1 .. 1 LOOP


--		INSERT INTO MANAGEMENT_ACCOUNT  SELECT * FROM public.management_account_bck;
		INSERT INTO MANAGEMENT_ACCOUNT (id,component,component_id,host,username,password,status ) VALUES (1,'ESXi',NULL,'hostname',block.username,'password','status');

--	END LOOP;



END;

$function$;



-- execute the function

select public.changeme();



--truncate MANAGEMENT_ACCOUNT;

