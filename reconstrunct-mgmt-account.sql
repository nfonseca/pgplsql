CREATE OR REPLACE FUNCTION public.rebuild_mgmt_account()
 RETURNS void
 LANGUAGE plpgsql
AS $function$

<<block>>

DECLARE

	total_esx int := 10;
	username varchar  := 'management';
	password varchar := 'ac11b0c9bd5e82ff7eba633845eaf9865fdf1b7b9cafd013';
	status varchar :='OK';
	hostPrefix  varchar :='cia-esx';
	hostSufix varchar :='.vsphere.local';
	PSChost varchar :='192.168.32.1';
	PSCuser  varchar :='management@localos';
	ESRShost varchar :='192.168.32.16';
	ESRSuser varchar :='management@localos';
	-- DO NOT CHANGE THESE ONES
	isESRS varchar :='ESRS';
	isPSC varchar :='PSC';
	isESX  varchar :='ESXi';
	
BEGIN


--Adds ESXi entries

	FOR esx  IN 1 .. block.total_esx LOOP

		INSERT INTO MANAGEMENT_ACCOUNT (id,component,component_id,host,username,password,status ) VALUES (nextval('public.management_account_id_seq'),block.isESX,NULL,block.hostPrefix||esx||block.hostSufix,block.username,block.password,block.status);

	END LOOP;

-- Adds PSC entry

	INSERT INTO public.MANAGEMENT_ACCOUNT (id,component,component_id,host,username,password,status ) VALUES (nextval('public.management_account_id_seq'),block.isPSC,NULL,block.PSChost,block.PSCuser,block.password,block.status);

-- Adds ESRS entry

	INSERT INTO public.MANAGEMENT_ACCOUNT (id,component,component_id,host,username,password,status ) VALUES (nextval('public.management_account_id_seq'),block.isESRS,NULL,block.ESRShost,block.ESRSuser,block.password,block.status);


END;

$function$





-- Call the function

select public.rebuild_mgmt_account();



truncate MANAGEMENT_ACCOUNT;


-- TODO

