CREATE OR REPLACE FUNCTION public.changeme()
 RETURNS void
 LANGUAGE plpgsql
AS $function$

<<block>>

DECLARE

	total_esx int := 3000;
	username varchar  := 'management';
	password varchar := 'ac11b0c9bd5e82ff7eba633845eaf9865fdf1b7b9cafd013';
	status varchar :='OK';
	isESX  varchar :='ESXi';
	hostPrefix  varchar :='cia-esx';
	hostSufix varchar :='.vsphere.local';

BEGIN

	FOR esx  IN 1 .. block.total_esx LOOP

		INSERT INTO MANAGEMENT_ACCOUNT (id,component,component_id,host,username,password,status ) VALUES (nextval('public.management_account_id_seq'),block.isESX,NULL,block.hostPrefix||esx||block.hostSufix,block.username,block.password,block.status);

	END LOOP;



END;

$function$





-- Call the function

select public.changeme();



truncate MANAGEMENT_ACCOUNT;


-- TODO

