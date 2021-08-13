CREATE OR REPLACE PROCEDURE app_db.insert_logs(IN event_date timestamp without time zone, IN user_id character, IN event_id integer, IN event_value double precision, IN params json)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
    INSERT INTO app_db.events_logs
    VALUES(event_date, user_id, event_id, event_value, params);
END
$BODY$;

CALL app_db.insert_logs('2017-09-13 12:01:00', 'aed-355-dg25', 1);
CALL app_db.insert_logs('2017-09-13 12:05:00', 'aed-355-dg25', 2);
CALL app_db.insert_logs('2017-09-13 12:08:00', 'ryf-734-em0', 2);
CALL app_db.insert_logs('2017-09-13 12:09:00', 'ryf-734-em0', 2);
CALL app_db.insert_logs('2017-09-13 12:15:00', 'aed-355-dg25', 3, 2.01);
CALL app_db.insert_logs('2017-09-13 13:15:00', 'aed-355-dg25', 3, 2.01);
CALL app_db.insert_logs('2017-09-13 12:15:00', 'aed-355-dg25', 3, 2.01);
CALL app_db.insert_logs('2017-09-16 12:01:00', 'aed-330-dg30', 1);
CALL app_db.insert_logs('2017-09-19 12:01:00', 'abc-123-ab12', 3, 2.01);
CALL app_db.insert_logs('2017-09-20 12:01:00', 'abc-123-ab12', 1);
CALL app_db.insert_logs('2017-09-22 12:01:00', 'abc-123-ab12', 1);
CALL app_db.insert_logs('2017-09-23 12:01:00', 'aed-355-dg25', 2);
CALL app_db.insert_logs('2017-09-25 12:01:00', 'aed-355-dg25', 3, 3.01);
CALL app_db.insert_logs('2017-09-26 12:01:00', 'aed-330-dg30', 1);
CALL app_db.insert_logs('2017-09-27 12:01:00', 'aed-355-dg25', 2);
CALL app_db.insert_logs('2017-09-29 12:01:00', 'abc-123-ab12', 3, 5.01);
CALL app_db.insert_logs('2017-09-28 12:01:00', 'aed-330-dg30', 1);
CALL app_db.insert_logs('2017-09-30 12:01:00', 'aed-330-dg30', 2);
CALL app_db.insert_logs('2017-09-01 12:01:00', 'aed-330-dg30', 3, 3.01);
CALL app_db.insert_logs('2017-09-02 12:01:00', 'abc-123-ab12', 1);
CALL app_db.insert_logs('2017-09-03 12:01:00', 'abc-123-ab12', 1);
CALL app_db.insert_logs('2017-09-04 12:01:00', 'aed-330-dg30', 3, 6.01);
CALL app_db.insert_logs('2017-09-05 12:01:00', 'aed-330-dg30', 1);
CALL app_db.insert_logs('2017-09-06 12:01:00', 'aed-330-dg30', 3, 8.01);
CALL app_db.insert_logs('2017-09-07 12:01:00', 'aed-355-dg25', 1);
CALL app_db.insert_logs('2017-09-08 12:01:00', 'abc-123-ab12', 3, 10.01);
CALL app_db.insert_logs('2017-09-09 12:01:00', 'abc-123-ab12', 1);
CALL app_db.insert_logs('2017-09-10 12:01:00', 'aed-355-dg25', 1);
CALL app_db.insert_logs('2017-09-11 12:01:00', 'aed-355-dg25', 3, 1.01);
CALL app_db.insert_logs('2017-09-12 12:01:00', 'abc-123-ab12', 3, 5.01);
CALL app_db.insert_logs('2017-09-13 12:01:00', 'abc-123-ab12', 2);
CALL app_db.insert_logs('2017-09-13 12:01:00', 'aed-355-dg25', 3, 3.01);

SELECT * FROM app_db.events_logs;