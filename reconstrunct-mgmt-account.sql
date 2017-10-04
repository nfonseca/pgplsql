CREATE OR REPLACE FUNCTION public.changeme()
 RETURNS void
 LANGUAGE plpgsql
AS $function$

DECLARE

	total_esx int := 3;
	username varchar  := 'management';
	password varchar := 'ac11b0c9bd5e82ff7eba633845eaf9865fdf1b7b9cafd013';
--	status varchar :='OK';

BEGIN

--FOR esx  IN 1..3 LOOP


	INSERT INTO MANAGEMENT_ACCOUNT  SELECT * FROM public.management_account_bck;


END;

$function$;



-- execute the function

select public.changeme();




