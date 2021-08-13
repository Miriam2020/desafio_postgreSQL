CREATE OR REPLACE PROCEDURE app_db.insert_events(IN event_id integer, IN description text)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
INSERT INTO app_db.events
VALUES(EVENT_ID, DESCRIPTION);
END
$BODY$;

CALL app_db.insert_events(1, 'APP_OPEN');
CALL app_db.insert_events(2, 'SEARCH');
CALL app_db.insert_events(3, 'PURCHASE');