CREATE OR REPLACE FUNCTION cutoff.get_head_batch(__document_ids bigint[])
  RETURNS common.document_head[] AS
$BODY$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        document_date,
        facility_code,
        curr_fsmt,
        'CUTOFF'::common.document_kind)::common.document_head
      FROM 
        cutoff.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION cutoff.get_head_batch(bigint[])
  OWNER TO postgres;

CREATE OR REPLACE FUNCTION cutoff.get_head_batch_proposed(
    __facility_code character varying,
    __date_start date,
    __date_end date)
  RETURNS common.document_head[] AS
$BODY$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        document_date,
        facility_code,
        curr_fsmt,
        'CUTOFF'::common.document_kind)::common.document_head
      FROM 
        cutoff.head
      WHERE 
        facility_code = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION cutoff.get_head_batch_proposed(character varying, date, date)
  OWNER TO postgres;
